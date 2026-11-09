$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$source = [IO.File]::ReadAllText((Join-Path $projectRoot 'feitico.xml'), [Text.Encoding]::UTF8)
# Eventos possuem Lua embutido; valida a estrutura visual sem interpretar esse codigo.
$source = [regex]::Replace($source, '(?s)(<event\b[^>]*>).*?(</event>)', '$1$2')
$source = [regex]::Replace($source, '(?s)(<script\b[^>]*>).*?(</script>)', '$1$2')
$document = [xml]$source
function Named([string]$name) {
    $node = $document.SelectSingleNode("//*[@name='$name']")
    if ($null -eq $node) { throw "Controle ausente: $name" }
    return $node
}
$canvas = Named 'aqui'
$panel = Named 'painelFeiticos'
if ([double]$panel.top + [double]$panel.height -gt [double]$canvas.height) { throw 'Painel de feiticos ultrapassa a altura de seu pai.' }
$header = Named 'cabecalhoFeitico'
$summary = Named 'resumoTalentos'
if ($summary.fontColor -ne '#B8860B') { throw 'O resumo de talentos precisa usar dourado escuro.' }
$body = Named 'paineisTextoFeitico'
if ([double]$header.height + [double]$summary.height + [double]$body.height -gt [double]$panel.height) {
    throw 'Cabecalho e textos sao maiores que a area de detalhes.'
}
$width = 0
foreach ($column in $body.SelectNodes('./layout')) { $width += [double]$column.width + 5 }
$details = Named 'boxDetalhesDoItem'
if ($width -gt [double]$details.width) { throw 'Colunas de texto ultrapassam a largura dos detalhes.' }
$testsPanel = Named 'painelTestesFeitico'
if ([double]$testsPanel.height + 10 -ge [double]$body.height) { throw 'O bloco de testes nao deixa espaco para os bonus.' }
foreach ($name in @('descricaoFeitico','efeitoFeitico','testesFeitico','bonusFeitico')) {
    $editor = Named $name
    if ($editor.LocalName -ne 'textEditor' -or $editor.align -ne 'client' -or $editor.readOnly -ne 'true' -or $editor.wordWrap -ne 'true') {
        throw "Texto sem rolagem, quebra de linha ou protecao de leitura: $name"
    }
    if ($editor.ParentNode.align -ne 'client') { throw "Texto fora da area disponivel: $name" }
}
Write-Output 'OK: detalhes cabem no painel; Descricao, Efeito, Testes e Bonus usam texto com rolagem e quebra de linha.'
