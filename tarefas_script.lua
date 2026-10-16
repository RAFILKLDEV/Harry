require("utils.lua")

local tarefasScript = {}

local function condition(sheet, tipo)
    if tipo == "fisico" then
        if sheet.Exausto then return -5 end
        if sheet.Fadigado then return -2 end
    elseif tipo == "mental" then
        if sheet.Tiltado then return -5 end
        if sheet.Frustrado then return -2 end
    end

    return nil
end

local function buildTreinoTexto(prefixo, nome, cd, penalidadeNome, penalidade)
    local texto = prefixo .. ": " .. nome .. " ( CD " .. cd .. " )"

    if penalidade then
        texto = texto .. " " .. penalidadeNome .. " " .. (-penalidade) ..
                    " = " .. ((-penalidade) + cd)
    end

    return texto
end

local function listaDeFeiticoParaTreino(sheet, str)
    local raiz = NDB.load("listfetico.xml")
    local filhos = NDB.getChildNodes(raiz)
    local mesaDoPersonagem = rrpg.getMesaDe(sheet)
    local chat = mesaDoPersonagem.chat
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
                    local penalidade = condition(sheet, "fisico")
                    chat:rolarDados("1d20+" .. (sheet.VIG or 0),
                                    buildTreinoTexto("Prática Feitiço",
                                                     listaFeiticos[k].nome,
                                                     sheet.treinoCD, "Fisico",
                                                     penalidade))
                else
                    local penalidade = condition(sheet, "mental")
                    chat:rolarDados("1d20+" .. (sheet.INTE or 0),
                                    buildTreinoTexto("Estudo Feitiço",
                                                     listaFeiticos[k].nome,
                                                     sheet.treinoCD, "Mental",
                                                     penalidade))
                end

                return
            end
        end
    end)
end

function tarefasScript.treinar(sheet)
    local mesaDoPersonagem = rrpg.getMesaDe(sheet)
    local chat = mesaDoPersonagem.chat

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
                local cd = tonumber(sheet[atributo] and sheet[atributo]) + 10

                if selectedAttrText == "Força" or
                    selectedAttrText == "Destreza" or
                    selectedAttrText == "Vigor" then
                    chat:rolarDados(
                        "1d20+" .. (sheet.VIG or 0),
                        "Treino de " .. selectedAttrText .. " (CD " .. cd ..
                            ")")
                else
                    chat:rolarDados(
                        "1d20+" .. (sheet.INTE or 0),
                        "Treino de " .. selectedAttrText .. " (CD " .. cd ..
                            ")")
                end
            end)
        elseif selectedText == "Estudar" then
            Dialogs.inputQuery("Cadastro", "Informe Seu Nome", "",
                               function(valorPreenchido)
                local cd = tonumber(valorPreenchido)

                if not cd then
                    showMessage(
                        "Valor inválido. Por favor, insira um número.")
                    return
                end

                sheet.treinoCD = cd

                chat:rolarDados(
                    "1d20+" .. (tonumber(sheet.VIG) or 0),
                    "Estudo (CD " .. cd .. ") " ..
                        (condition(sheet, "mental") and
                            "Mental " .. (-condition(sheet, "mental")) ..
                            " = " .. ((-condition(sheet, "mental")) + cd) or
                            ""))
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
                chat:rolarDados(
                    "1d20+" .. (tonumber(sheet.VIG) or 0),
                    "Pratica (CD " .. cd .. ") " ..
                        (condition(sheet, "fisico") and
                            "Fisico " .. (-condition(sheet, "fisico")) ..
                            " = " .. ((-condition(sheet, "fisico")) + cd) or
                            ""))
            end, function() showMessage("O usuário cancelou") end)
        elseif selectedText == "Estudar Feitiços" then
            listaDeFeiticoParaTreino(sheet, selectedText)
        elseif selectedText == "Praticar Feitiços" then
            listaDeFeiticoParaTreino(sheet, selectedText)
        end
    end)
end

return tarefasScript
