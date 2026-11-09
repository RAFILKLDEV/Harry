local Dialogs = require("dialogs.lua")
local anotacoes = {}

local function limparTitulo(value)
    return (tostring(value or ""):gsub("%s+", " "):match("^%s*(.-)%s*$"))
end

function anotacoes.renomearAba(self, sheet, campo)
    if self == nil or sheet == nil or campo == nil then return end
    local atual = limparTitulo(self.title or sheet[campo])
    Dialogs.inputQuery("Renomear aba", "Novo título:", atual, function(novoTitulo)
        novoTitulo = limparTitulo(novoTitulo)
        if novoTitulo == "" then return end
        sheet[campo] = novoTitulo
        self.title = novoTitulo
    end, nil, false)
end

function anotacoes.aplicarTitulos(form, sheet)
    if form == nil or sheet == nil or form.findControlByName == nil then return end
    for indice = 1, 8 do
        local campo = "tituloAnotacao" .. indice
        local aba = form:findControlByName("abaAnotacao" .. indice)
        local titulo = limparTitulo(sheet[campo])
        if aba ~= nil and titulo ~= "" then aba.title = titulo end
    end
end

return anotacoes
