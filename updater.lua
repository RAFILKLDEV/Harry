require("internet.lua")
require("plugins.lua")
require("dialogs.lua")
require("gui.lua")

local updater = {}

local MODULE_ID = "HarryPotter_Ficha"
local VERSION_URL = "https://api.github.com/repos/RAFILKLDEV/Harry/releases/latest"
local PACKAGE_URL = "https://github.com/RAFILKLDEV/Harry/releases/latest/download/Harry.rpk"
local checkStarted = false

local function parseVersion(value, allowLegacy)
    if type(value) ~= "string" then return nil end

    local major, minor, patch = value:match("^(%d+)%.(%d+)%.(%d+)$")
    if major == nil and allowLegacy then
        major, minor = value:match("^(%d+)%.(%d+)$")
        patch = "0"
    end
    if major == nil then return nil end

    for _, component in ipairs({major, minor, patch}) do
        if #component > 1 and component:sub(1, 1) == "0" then return nil end
    end

    return {major = major, minor = minor, patch = patch}
end

local function compareParts(left, right)
    for _, component in ipairs({"major", "minor", "patch"}) do
        local leftValue = left[component]
        local rightValue = right[component]
        if #leftValue ~= #rightValue then
            return #leftValue < #rightValue and -1 or 1
        end
        if leftValue ~= rightValue then
            return leftValue < rightValue and -1 or 1
        end
    end
    return 0
end

function updater.compareVersions(left, right)
    local leftParts = parseVersion(left, true)
    local rightParts = parseVersion(right, true)
    if leftParts == nil or rightParts == nil then return nil end
    return compareParts(leftParts, rightParts)
end

local function findInstalledPlugin()
    local ok, installed = pcall(Firecast.Plugins.getInstalledPlugins)
    if not ok then return nil, tostring(installed) end
    if type(installed) ~= "table" then
        return nil, "O Firecast não retornou a lista de plugins instalados."
    end

    for _, plugin in ipairs(installed) do
        if type(plugin) == "table" and plugin.moduleId == MODULE_ID then
            return plugin
        end
    end
    return nil, "O plugin instalado com o ID esperado não foi encontrado."
end

local function showError(message)
    Dialogs.showErrorMessage("Não foi possível atualizar o plugin Harry: " .. tostring(message))
end

local function openManualDownload(errorMessage)
    local reason = ""
    if errorMessage ~= nil and tostring(errorMessage) ~= "" then
        reason = "\nDetalhes: " .. tostring(errorMessage)
    end
    Dialogs.confirmYesNo(
        "A instalação automática não foi concluída." .. reason ..
        "\nDeseja abrir o download do arquivo .rpk para instalação manual?",
        function(accepted)
            if not accepted then return end
            local ok, errorMessage = pcall(GUI.openInBrowser, PACKAGE_URL)
            if not ok then
                showError(tostring(errorMessage) .. "\nBaixe manualmente em: " .. PACKAGE_URL)
            end
        end
    )
end

local function installDownloadedPackage(stream, expectedVersion)
    if type(stream) ~= "table" or tonumber(stream.size) == nil or tonumber(stream.size) <= 0 then
        showError("O arquivo .rpk baixado está vazio ou incompleto.")
        return
    end

    local detailsOk, details = pcall(Firecast.Plugins.getRPKDetails, stream)
    if not detailsOk or type(details) ~= "table" then
        showError("O Firecast não conseguiu validar o arquivo .rpk: " .. tostring(details))
        return
    end
    if details.moduleId ~= MODULE_ID then
        showError("O arquivo baixado pertence a outro módulo; a instalação foi cancelada.")
        return
    end

    local packageVersion = parseVersion(details.version, false)
    local expectedParts = parseVersion(expectedVersion, false)
    if packageVersion == nil or expectedParts == nil or compareParts(packageVersion, expectedParts) ~= 0 then
        showError("A versão do arquivo .rpk não corresponde à versão publicada no GitHub.")
        return
    end

    local installedPlugin, installedError = findInstalledPlugin()
    if installedPlugin == nil then
        showError(installedError)
        return
    end
    local installedParts = parseVersion(installedPlugin.version, true)
    if installedParts == nil then
        showError("A versão instalada não está em um formato reconhecido.")
        return
    end
    if compareParts(packageVersion, installedParts) <= 0 then return end

    stream.position = 0
    local installOk, installed, installError = pcall(Firecast.Plugins.installPlugin, stream)
    if not installOk or not installed then
        openManualDownload(not installOk and installed or installError)
        return
    end

    Dialogs.showMessage(
        "A instalação da versão " .. expectedVersion ..
        " foi solicitada. O Firecast carregará a atualização conforme o comportamento do aplicativo."
    )
end

local function downloadPackage(expectedVersion)
    local ok, errorMessage = pcall(
        Internet.download,
        PACKAGE_URL,
        function(stream)
            installDownloadedPackage(stream, expectedVersion)
        end,
        function(downloadError)
            showError("Falha ao baixar o arquivo .rpk: " .. tostring(downloadError))
        end
    )
    if not ok then
        showError("Falha ao iniciar o download do arquivo .rpk: " .. tostring(errorMessage))
    end
end

local function checkLatestVersion(installedPlugin)
    local installedParts = parseVersion(installedPlugin.version, true)
    if installedParts == nil then
        showError("A versão instalada não está em um formato reconhecido.")
        return
    end

    local requestOk, request = pcall(Internet.newHTTPRequest, "GET", VERSION_URL)
    if not requestOk then
        showError("Falha ao consultar o GitHub: " .. tostring(request))
        return
    end

    local setupOk, setupError = pcall(function()
        request:setRequestHeader("Accept", "application/vnd.github+json")
        request:setRequestHeader("User-Agent", "Harry-Firecast-Updater")
        request:addEventListener("onResponse", function()
            if tonumber(request.status) == 404 then
                return
            end
            if tonumber(request.status) ~= 200 then
                showError("O GitHub respondeu com o status " .. tostring(request.status) .. ".")
                return
            end

            local releaseTag = tostring(request.responseText or ""):match('"tag_name"%s*:%s*"([^"]+)"')
            local latestVersion = releaseTag and releaseTag:match("^v(%d+%.%d+%.%d+)$")
            local latestParts = parseVersion(latestVersion, false)
            if latestParts == nil then
                showError("A versão publicada no GitHub não está no formato major.minor.patch.")
                return
            end
            if compareParts(latestParts, installedParts) <= 0 then return end

            Dialogs.confirmOkCancel(
                "Há uma nova versão do plugin Harry (" .. latestVersion ..
                "). Deseja tentar instalá-la?",
                function(accepted)
                    if accepted then downloadPackage(latestVersion) end
                end
            )
        end)

        request:addEventListener("onError", function(errorMessage)
            showError("Falha ao consultar a versão no GitHub: " .. tostring(errorMessage))
        end)
        request:send()
    end)
    if not setupOk then
        showError("Falha ao iniciar a consulta ao GitHub: " .. tostring(setupError))
    end
end

function updater.check()
    if checkStarted then return end
    checkStarted = true

    local installedPlugin, errorMessage = findInstalledPlugin()
    if installedPlugin == nil then
        showError(errorMessage)
        return
    end
    checkLatestVersion(installedPlugin)
end

return updater
