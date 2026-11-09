require("utils.lua")
local condicoes = require("condicoes.lua")
local Dialogs = require("dialogs.lua")
local NDB = require("ndb.lua")

local tarefasScript = {}

local function rolarTreino(sheet, chat, atributo, tipo, titulo, cd)
    local campo = tipo == "fisico" and "Físico" or "Mental"
    local treino = condicoes.penalidadeDeTreino(sheet, tipo)
    local estado = condicoes.penalidade(sheet, tipo)
    local texto = titulo .. " (CD " .. cd .. ")"
    if treino ~= 0 then texto = texto .. " | " .. campo .. " (treino/estudo) " .. treino end
    if estado ~= 0 then texto = texto .. " | Condição " .. campo .. " " .. estado end
    chat:rolarDados("1d20" .. condicoes.termo(sheet[atributo]) ..
                    condicoes.termo(treino) .. condicoes.termo(estado), texto)
end

local function listaDeFeiticoParaTreino(sheet, str)
    local raiz = NDB.load("listfetico.xml")
    local filhos = NDB.getChildNodes(raiz)
    local mesaDoPersonagem = rrpg.getMesaDe(sheet)
    local chat = mesaDoPersonagem and mesaDoPersonagem.chat
    if chat == nil then return end
    local listaFeiticos = {}
    local listaNomesFeitico = {}

    for i = 1, #filhos, 1 do
        listaFeiticos[i] = raiz["f" .. i]
        listaNomesFeitico[i] = raiz["f" .. i].nome
    end

    table.sort(listaNomesFeitico)

    Dialogs.choose("Selecione uma das opções", listaNomesFeitico,
                   function(selected, selectedIndex, selectedText)
        if not selected then return end

        for k = 1, #filhos, 1 do
            if tostring(selectedText) == listaFeiticos[k].nome then
                sheet.treinoCD =
                    math.floor(totable(listaFeiticos[k].cdfArray)[1] / 2 + 5)

                if str == "Praticar Feitiços" then
                    rolarTreino(sheet, chat, "VIG", "fisico",
                                "Prática Feitiço: " .. listaFeiticos[k].nome, sheet.treinoCD)
                else
                    rolarTreino(sheet, chat, "INTE", "mental",
                                "Estudo Feitiço: " .. listaFeiticos[k].nome, sheet.treinoCD)
                end

                return
            end
        end
    end)
end

function tarefasScript.treinar(sheet)
    if sheet == nil then return end
    local mesaDoPersonagem = rrpg.getMesaDe(sheet)
    local chat = mesaDoPersonagem and mesaDoPersonagem.chat
    if chat == nil then return end

    Dialogs.choose("Escolha o tipo de treino:",
                   {"Atributo", "Estudar", "Estudar Feitiços", "Praticar",
                    "Praticar Feitiços"},
                   function(selected, selectedIndex, selectedText)
        if not selected then return end

        if selectedText == "Atributo" then
            local atributos = {
                ["Força"] = "FOR",
                ["Destreza"] = "DES",
                ["Vigor"] = "VIG",
                ["Inteligencia"] = "INTE",
                ["Sabedoria"] = "SAB",
                ["Presença"] = "PRE"
            }

            Dialogs.choose("Escolha o atributo para treinar:",
                           {"Força", "Destreza", "Vigor", "Inteligencia",
                            "Sabedoria", "Presença"},
                           function(selectedAttr, selectedAttrIndex,
                                    selectedAttrText)
                if not selectedAttr or selectedAttrText == nil then return end

                local atributo = atributos[selectedAttrText]
                local cd = (tonumber(sheet[atributo]) or 0) + 10

                if selectedAttrText == "Força" or
                    selectedAttrText == "Destreza" or
                    selectedAttrText == "Vigor" then
                    rolarTreino(sheet, chat, "VIG", "fisico", "Treino de " .. selectedAttrText, cd)
                else
                    rolarTreino(sheet, chat, "INTE", "mental", "Treino de " .. selectedAttrText, cd)
                end
            end)
        elseif selectedText == "Estudar" then
            Dialogs.inputQuery("Estudar", "Informe a CD do estudo", "",
                               function(valorPreenchido)
                local cd = tonumber(valorPreenchido)

                if not cd then
                    showMessage(
                        "Valor inválido. Por favor, insira um número.")
                    return
                end

                sheet.treinoCD = cd

                rolarTreino(sheet, chat, "INTE", "mental", "Estudo", cd)
            end, function() showMessage("O usuário cancelou") end)
        elseif selectedText == "Praticar" then
            Dialogs.inputQuery("Cadastro", "Informe a CD do treino", "",
                               function(valorPreenchido)
                local cd = tonumber(valorPreenchido)

                if not cd then
                    showMessage(
                        "Valor inválido. Por favor, insira um número.")
                    return
                end

                sheet.treinoCD = cd
                rolarTreino(sheet, chat, "VIG", "fisico", "Prática", cd)
            end, function() showMessage("O usuário cancelou") end)
        elseif selectedText == "Estudar Feitiços" then
            listaDeFeiticoParaTreino(sheet, selectedText)
        elseif selectedText == "Praticar Feitiços" then
            listaDeFeiticoParaTreino(sheet, selectedText)
        end
    end)
end

function tarefasScript.trainingModifierChanged(sheet, campo, oldValue, newValue)
    if sheet == nil or (campo ~= "fisico" and campo ~= "mental") then return end
    local root = NDB.getRoot(sheet) or sheet
    local novo = math.abs(tonumber(newValue) or 0)
    local antigo = math.abs(tonumber(oldValue) or 0)
    if root[campo] ~= novo then root[campo] = novo end
    if oldValue == nil or antigo == novo then return end
    local mesa = rrpg.getMesaDe(root)
    if mesa == nil or mesa.chat == nil then return end
    mesa.chat:enviarAcao("Penalidade de " .. (campo == "fisico" and "Físico" or "Mental") ..
                       " para treino/estudo: " .. antigo .. " → " .. novo)
end

return tarefasScript
