local templatesScript = {}

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

local atributoFisicoLabels = {
    ["AGILIDADE"] = true,
    ["DESTREZA"] = true,
    ["FORÇA"] = true,
    ["LUTA"] = true,
    ["VIGOR"] = true
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
    if mental then
        if sheet.Tiltado then return -5 end
        if sheet.Frustrado then return -2 end
    else
        if sheet.Exausto then return -5 end
        if sheet.Fadigado then return -2 end
    end

    return nil
end

local function updateSpellRectangle(self, node)
    if node == nil or self.rectangle == nil then return end

    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1) +
                                    (node.Dano_grad - 1) +
                                    (node.Range_grad - 1) +
                                    (node.Area_grad - 1) +
                                    (node.Duracao_grad - 1))

    if node.Grad == tonumber(graduacoes) then
        self.rectangle.color = "gray"
    elseif node.Grad > tonumber(graduacoes) then
        self.rectangle.color = "green"
    elseif node.Grad < tonumber(graduacoes) then
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

    local array = totable(node[field .. "_array"])
    local grad = tonumber(node[field .. "_grad"])
    local result = grad
    local graduacoes = tonumber((node.CD_grad - 1) + (node.Poder_grad - 1) +
                                    (node.Dano_grad - 1) +
                                    (node.Range_grad - 1) +
                                    (node.Area_grad - 1) +
                                    (node.Duracao_grad - 1))

    if delta < 0 then
        if (grad - 1) == graduacoes and node[field .. "_name"] == "Grad" then
            return
        end

        if grad > 1 then
            result = result - 1
            sheet[field .. "_grad"] = result
            sheet[field] = array[result]
            node[field .. "_grad"] = result
            node[field] = array[result]
        end
    else
        if node.Grad > graduacoes then
            if grad < #array then
                result = result + 1
                sheet[field .. "_grad"] = result
                sheet[field] = array[result]
                node[field .. "_grad"] = result
                node[field] = array[result]
            end
        elseif sheet[field .. "_name"] == "Grad" then
            result = result + 1
            sheet[field .. "_grad"] = result
            sheet[field] = array[result]
            node[field .. "_grad"] = result
            node[field] = array[result]
        end
    end

    updateSpellRectangle(self, node)
end

function templatesScript.checkConditionChanged(self, sheet, name)
    local mesaDoPersonagem = Firecast.getRoomOf(sheet)
    local chat = mesaDoPersonagem.chat
    local jogador = mesaDoPersonagem.meuJogador
    local root = getRoot(sheet)
    local nick = root.nomePersonagem or jogador.nick
    local texto = self[name].text

    if sheet[name] then
        if texto == "Exausto" and sheet.Fadigado then
            sheet.Fadigado = nil
            chat:enviarMensagem(nick .. " estava Fatigado agora está " .. texto)
        elseif texto == "Fadigado" and sheet.Exausto then
            sheet.Exausto = nil
            chat:enviarMensagem(nick .. " estava Exausto agora está " .. texto)
        elseif texto == "Tiltado" and sheet.Frustrado then
            sheet.Frustrado = nil
            chat:enviarMensagem(nick .. " estava Frustrado agora está " ..
                                    texto)
        elseif texto == "Frustrado" and sheet.Tiltado then
            sheet.Tiltado = nil
            chat:enviarMensagem(nick .. " estava Tiltado agora está " .. texto)
        else
            chat:enviarMensagem(nick .. " está " .. texto)
        end
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
    local penalty = getPenalty(sheet, atributoFisicoLabels[texto] ~= true)
    local valorBase = sheet[field2] or sheet[field1]

    chat:rolarDados("1d20 + " .. valorBase .. (penalty and penalty or ""),
                    (nodeMain.nomePersonagem and
                        nodeMain.nomePersonagem .. " - " or "") .. texto,
                    function(rolado) end)
end

return templatesScript
