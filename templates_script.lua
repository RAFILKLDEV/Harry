local templatesScript = {}
local condicoes = require("condicoes.lua")

local corpoLabels = {
    ["Acrobacia"] = true,
    ["Atletismo"] = true,
    ["Corpo-a-Corpo"] = true,
    ["Furtividade"] = true,
    ["Prestidigitação"] = true,
    ["Veiculos Mágicos"] = true,
    ["Iniciativa"] = true,
    ["Aparar"] = true,
    ["Fortitude"] = true,
    ["Reflexo"] = true,
    ["Resistencia"] = true
}

local quadribolMentalLabels = {
    ["Antecipar"] = true,
    ["Atrapalhar"] = true,
    ["Marcar Falta"] = true
}

local function getRoot(sheet)
    if sheet == nil then return nil end

    return NDB.getRoot(sheet)
end

local function getMesaChat(sheet)
    local mesaDoPersonagem = rrpg.getMesaDe(sheet)
    if mesaDoPersonagem == nil then return nil, nil end

    return mesaDoPersonagem, mesaDoPersonagem.chat
end

local function getPenalty(sheet, mental)
    local penalidade = condicoes.penalidade(sheet, mental and "mental" or "fisico")
    return penalidade ~= 0 and penalidade or nil
end

local function getAllocatedSpellLevels(node)
    local graduacoes = 0

    for _, field in ipairs({"CD", "Poder", "Dano", "Range", "Area", "Duracao"}) do
        graduacoes = graduacoes + ((tonumber(node[field .. "_grad"]) or 1) - 1)
    end

    return graduacoes
end

local function updateSpellRectangle(self, node)
    if node == nil or self.rectangle == nil then return end

    local graduacoes = getAllocatedSpellLevels(node)
    local grad = tonumber(node.Grad) or 0

    if grad == graduacoes then
        self.rectangle.color = "gray"
    elseif grad > graduacoes then
        self.rectangle.color = "green"
    elseif grad < graduacoes then
        self.rectangle.color = "red"
    end
end

local function getSpellNode(self, sheet)
    if self.boxDetalhesDoItem ~= nil and self.boxDetalhesDoItem.node ~= nil then
        return self.boxDetalhesDoItem.node
    end

    if self.rclMagias ~= nil and self.rclMagias.selectedNode ~= nil then
        return self.rclMagias.selectedNode
    end

    return sheet
end

function templatesScript.updateGradBadge(self, sheet, field, newValue)
    local grad = tonumber(newValue or sheet[field .. "_grad"] or 1) or 1
    local badge = self:findControlByName(field .. "GradBadge")

    if badge ~= nil then badge.text = tostring(grad - 1) end
end

function templatesScript.updateFieldHint(self, sheet, field)
    local ctrl = self:findControlByName(field)

    if ctrl ~= nil then ctrl.hint = tostring(sheet[field] or "") end
end

function templatesScript.changeSpellLevel(self, sheet, field, delta)
    local node = getSpellNode(self, sheet)
    if node == nil then return end

    local arrayValue = node[field .. "_array"]
    if arrayValue == nil then return end

    local ok, array = pcall(totable, arrayValue)
    if not ok or type(array) ~= "table" or #array == 0 then return end

    local grad = tonumber(node[field .. "_grad"]) or 1
    local result = grad + (delta < 0 and -1 or 1)
    if result < 1 or result > #array or array[result] == nil then return end

    local graduacoes = getAllocatedSpellLevels(node)

    if field == "Grad" then
        if delta < 0 and (tonumber(array[result]) or 0) < graduacoes then return end
    elseif delta > 0 and (tonumber(node.Grad) or 0) <= graduacoes then
        return
    end

    node[field .. "_grad"] = result
    node[field] = array[result]

    updateSpellRectangle(self, node)
end

function templatesScript.checkConditionChanged(self, sheet, name)
    local root = getRoot(sheet)
    if root == nil then return end
    local opostas = {Fadigado = "Exausto", Exausto = "Fadigado", Frustrado = "Tiltado", Tiltado = "Frustrado"}
    local anterior = opostas[name]
    local substituiu = root[name] and anterior ~= nil and root[anterior]
    -- A condição deve funcionar mesmo ao editar a ficha fora de uma mesa.
    if substituiu then root[anterior] = nil end

    local mesaDoPersonagem, chat = getMesaChat(root)
    if mesaDoPersonagem == nil or chat == nil then return end
    local jogador = mesaDoPersonagem.meuJogador
    local nick = root.nomePersonagem or (jogador and jogador.nick) or "Personagem"
    local texto = (self[name] and self[name].text) or name
    if root[name] then
        if substituiu then
            local nomeAnterior = anterior == "Fadigado" and "Fatigado" or anterior
            chat:enviarMensagem(nick .. " estava " .. nomeAnterior .. " agora está " .. texto)
        else chat:enviarMensagem(nick .. " está " .. texto) end
    else
        chat:enviarMensagem(nick .. " não está mais " .. texto)
    end
end

function templatesScript.rollLabelComEdit(self, sheet, name, total)
    local mesaDoPersonagem, chat = getMesaChat(sheet)
    if mesaDoPersonagem == nil or chat == nil then return end

    local nodeMain = getRoot(sheet)
    local texto = self[name].text
    local penalty = getPenalty(sheet, not corpoLabels[texto])

    chat:rolarDados("1d20 + " .. (sheet[total] or 0) ..
                        (penalty and penalty or ""),
                    (nodeMain.nomePersonagem and
                        nodeMain.nomePersonagem .. " - " or "") .. texto,
                    function(rolado) end)
end

function templatesScript.rollQuadribol(self, sheet, name, total)
    local mesaDoPersonagem, chat = getMesaChat(sheet)
    if mesaDoPersonagem == nil or chat == nil then return end

    local nodeMain = getRoot(sheet)
    local texto = self[name].text
    local penalty = getPenalty(sheet, quadribolMentalLabels[texto] == true)

    chat:rolarDados("1d20 + " .. (sheet[total] or 0) ..
                        (penalty and penalty or ""),
                    (nodeMain.nomePersonagem and
                        nodeMain.nomePersonagem .. " - " or "") .. texto,
                    function(rolado) end)
end

function templatesScript.rollAtributo(self, sheet, name, field1, field2)
    local mesaDoPersonagem, chat = getMesaChat(sheet)
    if mesaDoPersonagem == nil or chat == nil then return end

    local nodeMain = getRoot(sheet)
    local texto = self[name].text
    local penalty = condicoes.penalidadeDoAtributo(sheet, field1)
    local valorBase = tonumber(sheet[field2]) or tonumber(sheet[field1]) or 0

    chat:rolarDados("1d20" .. condicoes.termo(valorBase) .. condicoes.termo(penalty),
                    (nodeMain.nomePersonagem and
                        nodeMain.nomePersonagem .. " - " or "") .. texto,
                    function(rolado) end)
end

function templatesScript.rollOtherSkill(self, sheet)
    local mesaDoPersonagem, chat = getMesaChat(sheet)
    if mesaDoPersonagem == nil or chat == nil then return end
    local penalty = condicoes.penalidadeDoAtributo(sheet, sheet.ATRIBUTO)
    chat:rolarDados("1d20" .. condicoes.termo(sheet.TOTAL) .. condicoes.termo(penalty),
                    sheet.NOME or "Perícia")
end

return templatesScript
