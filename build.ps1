param([switch]$Lint)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$projectRoot = [IO.Path]::GetFullPath($PSScriptRoot)
$compiler = (Get-Command rdk.exe -ErrorAction Stop).Source
$temporaryParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$buildRoot = Join-Path $temporaryParent ('Harry-build-' + [guid]::NewGuid().ToString('N'))
$stage = Join-Path $buildRoot 'Harry'
$outputDirectory = Join-Path $projectRoot 'output'
$sourceModule = [xml](Get-Content -LiteralPath (Join-Path $projectRoot 'module.xml') -Raw -Encoding UTF8)
$sourceForm = [xml](Get-Content -LiteralPath (Join-Path $projectRoot 'harry.lfm') -Raw -Encoding UTF8)
$layoutCheck = Join-Path $projectRoot 'tests/layout_test.ps1'
if (Test-Path -LiteralPath $layoutCheck) { & $layoutCheck }

function Read-PackageEntry($archive, [string]$name) {
    $entry = $archive.GetEntry($name)
    if ($null -eq $entry) { throw "Arquivo ausente no pacote: $name" }
    $reader = [IO.StreamReader]::new($entry.Open(), [Text.Encoding]::UTF8)
    try { return $reader.ReadToEnd() } finally { $reader.Dispose() }
}

try {
    New-Item -ItemType Directory -Path $stage -Force | Out-Null
    # A compilação recebe apenas fontes da ficha e recursos usados em execução.
    # Testes, scripts de desenvolvimento e pacotes antigos ficam fora do build.
    $runtimeFiles = @(Get-ChildItem -LiteralPath $projectRoot -File | Where-Object { $_.Extension -in @('.lua', '.lfm', '.xml') })
    foreach ($file in $runtimeFiles) { Copy-Item -LiteralPath $file.FullName -Destination $stage }
    foreach ($directory in @('sdk', 'imagens')) {
        Copy-Item -LiteralPath (Join-Path $projectRoot $directory) -Destination $stage -Recurse
    }

    Push-Location -LiteralPath $stage
    try {
        if ($Lint) { & $compiler -l } else { & $compiler -c }
        if ($LASTEXITCODE -ne 0) { throw "O compilador falhou: $LASTEXITCODE" }
    } finally { Pop-Location }

    $builtPackage = Join-Path $stage 'output/Harry.rpk'
    if (-not (Test-Path -LiteralPath $builtPackage)) { throw 'O compilador não gerou Harry.rpk.' }
    $archive = [IO.Compression.ZipFile]::OpenRead($builtPackage)
    try {
        $forbidden = @($archive.Entries | Where-Object {
            $_.FullName -match '(^|/)(tests?|output|\.git)/' -or
            $_.FullName -match '\.(ps1|testlua|zip|rpk)$'
        })
        if ($forbidden.Count) { throw ('Arquivos de desenvolvimento no pacote: ' + ($forbidden.FullName -join ', ')) }
        foreach ($entry in $archive.Entries) {
            if ($entry.FullName -match '\.lua$') {
                $text = Read-PackageEntry $archive $entry.FullName
                if ($text.Contains('condicoes_test') -or $text.Contains('fora do loader de arquivos Firecast')) {
                    throw "Código de teste no arquivo compilado: $($entry.FullName)"
                }
            }
        }

        $compiledModule = [xml](Read-PackageEntry $archive 'module.xml')
        foreach ($property in @('id', 'version', 'sdkVersion')) {
            if ([string]$compiledModule.module.$property -ne [string]$sourceModule.module.$property) {
                throw "Identidade do módulo alterada: $property"
            }
        }
        if ([string]$compiledModule.module.info.name -ne [string]$sourceModule.module.info.name) {
            throw 'Nome do módulo alterado.'
        }
        $dataType = $compiledModule.module.assembledFeatures.dataTypes.dataType
        if ($dataType.id -ne $sourceForm.form.dataType -or $dataType.formName -ne $sourceForm.form.name) {
            throw 'Tipo de dados da ficha alterado.'
        }
        foreach ($file in $runtimeFiles | Where-Object Name -NE 'module.xml') {
            $entry = $archive.GetEntry($file.Name)
            if ($null -eq $entry) { throw "Fonte ausente no pacote: $($file.Name)" }
            $stream = $entry.Open()
            $hasher = [Security.Cryptography.SHA256]::Create()
            try { $entryHash = [BitConverter]::ToString($hasher.ComputeHash($stream)).Replace('-', '') }
            finally { $stream.Dispose(); $hasher.Dispose() }
            if ($entryHash -ne (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash) {
                throw "Fonte desatualizada no pacote: $($file.Name)"
            }
        }
        Write-Output "Pacote validado: ID $($compiledModule.module.id), versão $($compiledModule.module.version), ficha $($dataType.id); nenhum teste incluído."
    } finally { $archive.Dispose() }

    New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
    foreach ($name in @('Harry.rpk', 'Harry-corrigido.rpk')) {
        Copy-Item -LiteralPath $builtPackage -Destination (Join-Path $outputDirectory $name) -Force
    }
    Copy-Item -LiteralPath (Join-Path $stage 'output/rdkObjs') -Destination $outputDirectory -Recurse -Force
    Write-Output 'Atualizados: output/Harry.rpk e output/Harry-corrigido.rpk.'
} finally {
    if (Test-Path -LiteralPath $buildRoot) {
        $resolvedBuildRoot = [IO.Path]::GetFullPath((Resolve-Path -LiteralPath $buildRoot).Path)
        if ((Split-Path $resolvedBuildRoot -Parent).TrimEnd('\', '/') -ne $temporaryParent -or
            (Split-Path $resolvedBuildRoot -Leaf) -notmatch '^Harry-build-[a-f0-9]{32}$') {
            throw "Pasta temporária fora do local esperado: $resolvedBuildRoot"
        }
        Remove-Item -LiteralPath $resolvedBuildRoot -Recurse -Force
    }
}
