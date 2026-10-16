local Dialogs = require("dialogs.lua")
local NDB = require("ndb.lua")
local GUI = require("gui.lua")
require("utils.lua")

local feiticoScript = {}

local function getSpellNode(self, sheet)
    local node = nil

    if self ~= nil then
        if self.boxDetalhesDoItem ~= nil then node = self.boxDetalhesDoItem.node end

        if node == nil and self.rclMagias ~= nil then
            node = self.rclMagias.selectedNode
        end
    end

    if node == nil and sheet ~= nil and sheet.Grad ~= nil then node = sheet end

    return node
end

local function getRootSheet(self, sheet)
    local node = getSpellNode(self, sheet)

    if node ~= nil then return NDB.getRoot(node) end
    if sheet ~= nil then return NDB.getRoot(sheet) end

    return nil
end

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

local function definirEscola(self, sheet)
    local node = getSpellNode(self, sheet)
    local root = getRootSheet(self, sheet)

    if node == nil or root == nil then return nil end

    if node.escola == "Adivinhação" then
        return root.C_ADI_Total
    elseif node.escola == "Azaração" then
        return root.C_AZA_Total
    elseif node.escola == "Contra-Feitiço" then
        return root.C_CON_Total
    elseif node.escola == "Encantamento" then
        return root.C_ENC_Total
    elseif node.escola == "Feitiço" then
        return root.C_FEI_Total
    elseif node.escola == "Transmutação" then
        return root.C_TRA_Total
    elseif node.escola == "Maldição" then
        return root.C_MAL_Total
    end

    return nil
end

local function textoChat(value)
    local texto = tostring(value or "")
    texto = texto:gsub("&#[xX]20;", " "):gsub("&#32;", " ")
                 :gsub("&nbsp;", " "):gsub("\\%*", "*")
    return (texto:gsub("%s+", " "):match("^%s*(.-)%s*$"))
end

local function stats(self, sheet)
    local node = getSpellNode(self, sheet)
    local partes = {}

    if node == nil then return "" end

    for _, campo in ipairs({{"Grad", "Graduação"}, {"CD", "CD"},
                            {"Dano", "Dano"}, {"Poder", "Poder"},
                            {"Range", "Alcance"}, {"Area", "Área"},
                            {"Duracao", "Duração"}, {"Ataque", "Ataque"}}) do
        local valor = textoChat(node[campo[1]])
        local obrigatorio = campo[1] == "Grad" or campo[1] == "CD"
        if valor ~= "" and valor ~= "-" and
            (obrigatorio or tonumber(valor) ~= 0) then
            partes[#partes + 1] = "[§K10]" .. campo[2] .. ": [§K1]" .. valor
        end
    end

    return table.concat(partes, " [§K8]| ")
end

local function addSignedPart(parts, value)
    value = tonumber(value) or 0

    if value == 0 then return end

    if value > 0 then
        parts[#parts + 1] = "+" .. value
    else
        parts[#parts + 1] = tostring(value)
    end
end

local function addRollDetail(details, label, value)
    value = tonumber(value) or 0

    if value == 0 then return end

    if value > 0 then
        details[#details + 1] = "[§K8]" .. label .. " [§K1]+" .. value
    else
        details[#details + 1] = "[§K8]" .. label .. " [§K1]" .. value
    end
end

local function rolarLocal(chat, expressao, mensagem)
    local rolagem = rrpg.interpretarRolagem(expressao)

    rolagem:rolarLocalmente()

    local termos = {}
    for _, operacao in ipairs(rolagem.ops or {}) do
        if operacao.tipo == "dado" then
            for _, resultado in ipairs(operacao.resultados or {}) do
                termos[#termos + 1] = tostring(resultado)
            end
        elseif operacao.tipo == "imediato" then
            local valor = tonumber(operacao.valor) or 0
            if valor ~= 0 then
                termos[#termos + 1] = (valor > 0 and "+" or "-") .. math.abs(valor)
            end
        end
    end

    local detalhamento = table.concat(termos, " ")
    if detalhamento == "" then detalhamento = tostring(rolagem.resultado) end

    chat:enviarMensagem((mensagem or "Rolagem") .. " [§K8]| [§K1]" ..
                            detalhamento .. " = [§K10]" .. tostring(rolagem.resultado))

    return rolagem
end

local function isAttackSpell(node)
    return node ~= nil and (node.tipo == "Ataque" or node.tipo == "Ataque Base")
end

local function calcularConc(preview)
    local graduacoes = (preview.CD_grad - 1) + (preview.Poder_grad - 1) +
                           (preview.Dano_grad - 1) +
                           (preview.Range_grad - 1) +
                           (preview.Area_grad - 1) +
                           (preview.Duracao_grad - 1) +
                           ((preview.Ataque_grad or 1) - 1)

    local excesso = graduacoes - preview.Grad

    if excesso > 0 then return excesso * 2 end

    return 0
end

local function copiarEstado(node, preview)
    local original = {}

    for k, _ in pairs(preview) do
        original[#original + 1] = {campo = k, valor = node[k]}
    end

    return original
end

function feiticoScript.abrirPopUp(self, sheet)
    local controle = self:findControlByName("popUp")
    local node = getSpellNode(self, sheet)
    local root = getRootSheet(self, sheet)

    if controle ~= nil then controle.visible = true end
    if node == nil or root == nil then return end

    local raiz = NDB.load("listfetico.xml")
    local filhos = NDB.getChildNodes(raiz)

    local listaFeiticos = {}
    local listaNomesFeitico = {}

    for i = 1, #filhos, 1 do
        listaFeiticos[i] = raiz["f" .. i]
        listaNomesFeitico[i] = raiz["f" .. i].nome
        table.sort(listaNomesFeitico)
    end

    for k = 1, #filhos, 1 do
        if node.nome == listaFeiticos[k].nome then
            root.escola2 = listaFeiticos[k].escola
            root.tipo2 = listaFeiticos[k].cast
            root.Efeito2 = listaFeiticos[k].efeito
            root.Grad2 = totable(listaFeiticos[k].gradArray)[1]
            root.CD2 = totable(listaFeiticos[k].cdfArray)[1]
            root.Dano2 = totable(listaFeiticos[k].danoArray)[1]
            root.Poder2 = totable(listaFeiticos[k].poderArray)[1]
            root.Range2 = totable(listaFeiticos[k].rangeArray)[1]
            root.Area2 = totable(listaFeiticos[k].areaArray)[1]
            root.Duracao2 = totable(listaFeiticos[k].duracaoArray)[1]

            root.escola = node.escola
            root.tipo = node.tipo
            root.Grad = node.Grad
            root.CD = node.CD
            root.Dano = node.Dano
            root.Poder = node.Poder
            root.Range = node.Range
            root.Area = node.Area
            root.Duracao = node.Duracao

            root.Desc = listaFeiticos[k].desc
            root.Efeito = listaFeiticos[k].efeito
            root.Bonus = listaFeiticos[k].bonus
        end
    end
end

function feiticoScript.condition(sheet, tipo) return condition(sheet, tipo) end

function feiticoScript.Aceitar(self)
    Dialogs.confirmOkCancel("Deseja Apagar esse Feitiço ?",
                            function(confirmado)
        if confirmado then
            local node = getSpellNode(self)

            if node ~= nil then NDB.deleteNode(node) end
        end
    end)
end

function feiticoScript.definirEscola(self, sheet)
    return definirEscola(self, sheet)
end

function feiticoScript.stats(self, sheet) return stats(self, sheet) end

function feiticoScript.rolarFeitico(self, sheet, onFinish)
    local node = getSpellNode(self, sheet)
    local root = getRootSheet(self, sheet)

    local function finalizarRolagem()
        if onFinish then
            local callback = onFinish
            onFinish = nil
            callback()
        end
    end

    if node == nil or root == nil then
        finalizarRolagem()
        return
    end

    local minhaMesa = Firecast.getRoomOf(root)
    if minhaMesa == nil or minhaMesa.chat == nil then
        finalizarRolagem()
        Dialogs.showMessage("Abra a ficha em uma mesa para rolar o feitiço.")
        return
    end

    local chat = minhaMesa.chat
    local cd = tonumber(node.CD)
    if cd == nil then
        finalizarRolagem()
        Dialogs.showMessage("Defina uma CD numérica para este feitiço antes de rolar.")
        return
    end

    local nome = textoChat(node.nome)
    if nome == "" then nome = "Feitiço" end
    local nick = textoChat(root.nomePersonagem)
    if nick == "" then
        nick = textoChat(minhaMesa.meuJogador and minhaMesa.meuJogador.nick)
    end
    if nick == "" then nick = "Conjurador" end

    local grad = tonumber(node.Grad) or 0
    local conc = tonumber(root.concentracao) or 0
    local mental = condition(root, "mental") or 0
    local escolaTotal = tonumber(definirEscola(self, sheet)) or 0
    local escola = math.floor(escolaTotal / 2)
    local partesRolagem = {"1d20"}
    local detalhesRolagem = {}

    -- Concentração já é descontada do teste; a comparação usa a CD base.
    addSignedPart(partesRolagem, grad)
    addSignedPart(partesRolagem, escola)
    addSignedPart(partesRolagem, -conc)
    addSignedPart(partesRolagem, mental)
    addRollDetail(detalhesRolagem, "Graduação", grad)
    addRollDetail(detalhesRolagem, "Escola", escola)
    addRollDetail(detalhesRolagem, "Concentração", -conc)
    addRollDetail(detalhesRolagem, "Mental", mental)

    local function mensagemTeste(titulo, detalhes)
        local mensagem = "[§K10]" .. titulo
        if #detalhes > 0 then
            mensagem = mensagem .. " [§K8]| " .. table.concat(detalhes, " [§K8]| ")
        end
        return mensagem
    end

    chat:enviarMensagem("[§K6]" .. nome .. " [§K8]| [§K1]" .. nick)
    local rolagem = rolarLocal(chat, table.concat(partesRolagem, ""),
                              mensagemTeste("Conjuração", detalhesRolagem))
    local resultado = rolagem.resultado
    if resultado < cd then
        -- Mantém os limites de estágios usados pela ficha: 5, 10 e 15.
        local estagios = math.min(4, math.floor((cd - resultado) / 5) + 1)
        chat:enviarMensagem("[§K4]Falha [§K8]| [§K1]" .. resultado ..
            " < CD " .. cd .. " [§K8]| [§K4]" .. estagios ..
            (estagios == 1 and " estágio" or " estágios"))
        finalizarRolagem()
        return
    end

    chat:enviarMensagem("[§K9]Sucesso! [§K8]| [§K1]" .. resultado ..
                       " >= CD " .. cd)
    chat:enviarMensagem(stats(self, sheet))
    local testes = textoChat(node.defesa)
    if testes ~= "" and testes ~= "-" and testes ~= "0" then
        chat:enviarMensagem("[§K10]Testes: [§K1]" .. testes)
    end

    if isAttackSpell(node) then
        local des = tonumber(root.DES) or 0
        local ataque = tonumber(node.Ataque) or 0
        local acerto = tonumber(root.acerto) or 0
        local fisico = condition(root, "fisico") or 0
        local partesAtaque = {"1d20"}
        local detalhesAtaque = {}

        addSignedPart(partesAtaque, grad)
        addSignedPart(partesAtaque, des)
        addSignedPart(partesAtaque, ataque)
        addSignedPart(partesAtaque, -acerto)
        addSignedPart(partesAtaque, fisico)
        addRollDetail(detalhesAtaque, "Graduação", grad)
        addRollDetail(detalhesAtaque, "Destreza", des)
        addRollDetail(detalhesAtaque, "Ataque", ataque)
        addRollDetail(detalhesAtaque, "Acerto", -acerto)
        addRollDetail(detalhesAtaque, "Físico", fisico)

        rolarLocal(chat, table.concat(partesAtaque, ""),
                   mensagemTeste("Ataque", detalhesAtaque))
        finalizarRolagem()
    elseif node.tipo == "Defesa" then
        Dialogs.choose("Ataque corpo a corpo ou à distância?",
                       {"Corpo-a-Corpo", "Distancia"},
                       function(selected, selectedIndex, selectedText)
            if not selected then
                finalizarRolagem()
                return
            end

            local corpoACorpo = selectedText == "Corpo-a-Corpo"
            local defesaValor = tonumber(corpoACorpo and root.APA_Total or root.REF_Total) or 0
            local poder = tonumber(node.Poder) or 0
            local mod = condition(root, "fisico") or 0
            local partesDefesa = {"1d8"}
            local detalhesDefesa = {}
            addSignedPart(partesDefesa, 10)
            addSignedPart(partesDefesa, poder)
            addSignedPart(partesDefesa, defesaValor)
            addSignedPart(partesDefesa, mod)
            addRollDetail(detalhesDefesa, "Base", 10)
            addRollDetail(detalhesDefesa, "Poder", poder)
            addRollDetail(detalhesDefesa, corpoACorpo and "Aparar" or "Reflexos", defesaValor)
            addRollDetail(detalhesDefesa, "Físico", mod)

            rolarLocal(chat, table.concat(partesDefesa, ""),
                mensagemTeste("Defesa (CA) - " .. nome .. " - " ..
                    (corpoACorpo and "Corpo a corpo" or "Distância"), detalhesDefesa))
            finalizarRolagem()
        end)
    else
        finalizarRolagem()
    end
end

function feiticoScript.abrirPopupFeitico(self, sheet)
    local node = getSpellNode(self, sheet)

    if node == nil then return end

    local popup = GUI.newPopupForm()
    popup.width = 320
    popup.height = 400
    popup.placement = "center"
    popup.drawContainer = true

    local layout = GUI.newLayout()
    layout.parent = popup
    layout.align = "client"
    layout.margins = {left = 10, right = 10, top = 10, bottom = 10}

    local lblTitulo = GUI.newLabel()
    lblTitulo.parent = layout
    lblTitulo.text = node.nome or "Feitiço"
    lblTitulo.align = "top"
    lblTitulo.height = 30
		lblTitulo.fontSize = 24
    lblTitulo.horzTextAlign = "center"

    local function valorInicialPopup(field, arrayOverride)
        local grad = tonumber(node[field .. "_grad"]) or 1
        local array = arrayOverride or totable(node[field .. "_array"])

        if array and array[grad] ~= nil then return array[grad] end

        return node[field] or 0
    end

    local ataqueArray = nil

    if isAttackSpell(node) then
        ataqueArray = {}

        for i = 0, 20, 1 do ataqueArray[#ataqueArray + 1] = i end
    end

    local preview = {
        Grad = tonumber(node.Grad) or 0,
        CD = valorInicialPopup("CD"),
        Dano = valorInicialPopup("Dano"),
        Area = valorInicialPopup("Area"),
        Range = valorInicialPopup("Range"),
        Duracao = valorInicialPopup("Duracao"),
        Poder = valorInicialPopup("Poder"),
        Grad_grad = tonumber(node.Grad_grad) or 1,
        CD_grad = tonumber(node.CD_grad) or 1,
        Dano_grad = tonumber(node.Dano_grad) or 1,
        Area_grad = tonumber(node.Area_grad) or 1,
        Range_grad = tonumber(node.Range_grad) or 1,
        Duracao_grad = tonumber(node.Duracao_grad) or 1,
        Poder_grad = tonumber(node.Poder_grad) or 1
    }

    if ataqueArray ~= nil then
        preview.Ataque = valorInicialPopup("Ataque", ataqueArray)
        preview.Ataque_grad = tonumber(node.Ataque_grad) or 1
    end

    local lblConc = GUI.newLabel()
    lblConc.parent = layout
    lblConc.align = "top"
    lblConc.height = 25
		lblConc.fontSize = 18
    lblConc.horzTextAlign = "center"

    local function atualizarConc()
        local conc = calcularConc(preview)
        lblConc.text = "Concentração: " .. conc
        return conc
    end

    local function criarCampo(nome, field, arrayOverride)
        local linha = GUI.newLayout()
        linha.parent = layout
        linha.align = "top"
        linha.height = 40
				linha.margins = {top = 3}

        local lbl = GUI.newLabel()
        lbl.parent = linha
        lbl.width = 90
        lbl.align = "left"
        lbl.text = nome
        lbl.horzTextAlign = "center"

        local btnMenos = GUI.newButton()
        btnMenos.parent = linha
        btnMenos.text = "-"
        btnMenos.width = 30
        btnMenos.align = "left"

        local valor = GUI.newLabel()
        valor.parent = linha
        valor.width = 60
        valor.align = "left"
        valor.horzTextAlign = "center"

        local btnMais = GUI.newButton()
        btnMais.parent = linha
        btnMais.text = "+"
        btnMais.width = 30
        btnMais.align = "left"

        local function atualizarValor()
            valor.text = tostring(preview[field] or "")
        end

        btnMais.onClick = function()
            local array = arrayOverride or totable(node[field .. "_array"])
            local grad = preview[field .. "_grad"] or 1

            if array == nil or #array == 0 then return end

            if grad < #array then
                grad = grad + 1
                preview[field .. "_grad"] = grad
                preview[field] = array[grad]
            end

            atualizarValor()
            atualizarConc()
        end

        btnMenos.onClick = function()
            local array = arrayOverride or totable(node[field .. "_array"])
            local grad = preview[field .. "_grad"] or 1

            if array == nil or #array == 0 then return end

            if grad > 1 then
                grad = grad - 1
                preview[field .. "_grad"] = grad
                preview[field] = array[grad]
            end

            atualizarValor()
            atualizarConc()
        end

        atualizarValor()
    end

    for _, field in ipairs({"Dano", "Area", "Range", "Duracao", "Poder"}) do
        local array = totable(node[field .. "_array"])

        if array and #array > 1 then criarCampo(field, field) end
    end

    if ataqueArray ~= nil then criarCampo("Ataque", "Ataque", ataqueArray) end

    atualizarConc()

    local btnRolar = GUI.newButton()
    btnRolar.parent = layout
    btnRolar.align = "bottom"
    btnRolar.height = 40
    btnRolar.text = "ROLAR FEITIÇO"

    btnRolar.onClick = function()
        local original = copiarEstado(node, preview)
        local root = NDB.getRoot(node)
        local concOriginal = root.concentracao

        for k, v in pairs(preview) do
            node[k] = v
        end

        local conc = atualizarConc()
        root.concentracao = conc

        feiticoScript.rolarFeitico(self, sheet, function()
            for _, estado in ipairs(original) do
                node[estado.campo] = estado.valor
            end

            root.concentracao = concOriginal
        end)

        popup:close()
    end

    popup:show()
end

function feiticoScript.ListaDeFeitico(self, sheet)
    local raiz = NDB.load("listfetico.xml")
    local filhos = NDB.getChildNodes(raiz)
    local node = getSpellNode(self, sheet)

    local listaFeiticos = {}
    local listaNomesFeitico = {}

    for i = 1, #filhos, 1 do
        listaFeiticos[i] = raiz["f" .. i]
        listaNomesFeitico[i] = raiz["f" .. i].nome
        table.sort(listaNomesFeitico)
    end

    Dialogs.choose("Selecione uma das opções", listaNomesFeitico,
                   function(selected, selectedIndex, selectedText)
        if selected then
            for k = 1, #filhos, 1 do
                if tostring(selectedText) == listaFeiticos[k].nome then
                    sheet.nome = listaFeiticos[k].nome
                    sheet.escola = listaFeiticos[k].escola
                    sheet.defesa = listaFeiticos[k].defesa
                    sheet.tipo = listaFeiticos[k].cast
                    sheet.Efeito = listaFeiticos[k].efeito
                    sheet.Desc = listaFeiticos[k].desc

                    node.nome = listaFeiticos[k].nome
                    node.escola = listaFeiticos[k].escola
                    node.defesa = listaFeiticos[k].defesa
                    node.tipo = listaFeiticos[k].cast
                    node.Efeito = listaFeiticos[k].efeito
                    node.Desc = listaFeiticos[k].desc

                    sheet.Grad = totable(listaFeiticos[k].gradArray)[1]
                    sheet.Grad_name = "Grad"
                    sheet.Grad_grad = 1
                    sheet.Grad_array = listaFeiticos[k].gradArray

                    sheet.CD = totable(listaFeiticos[k].cdfArray)[1]
                    sheet.CD_name = "CD"
                    sheet.CD_grad = 1
                    sheet.CD_array = listaFeiticos[k].cdfArray

                    sheet.Dano = totable(listaFeiticos[k].danoArray)[1]
                    sheet.Dano_name = "Dano"
                    sheet.Dano_grad = 1
                    sheet.Dano_array = listaFeiticos[k].danoArray

                    sheet.Poder = totable(listaFeiticos[k].poderArray)[1]
                    sheet.Poder_name = "Poder"
                    sheet.Poder_grad = 1
                    sheet.Poder_array = listaFeiticos[k].poderArray

                    sheet.Range = totable(listaFeiticos[k].rangeArray)[1]
                    sheet.Range_name = "Range"
                    sheet.Range_grad = 1
                    sheet.Range_array = listaFeiticos[k].rangeArray

                    sheet.Area = totable(listaFeiticos[k].areaArray)[1]
                    sheet.Area_name = "Area"
                    sheet.Area_grad = 1
                    sheet.Area_array = listaFeiticos[k].areaArray

                    sheet.Duracao = totable(listaFeiticos[k].duracaoArray)[1]
                    sheet.Duracao_name = "Duracao"
                    sheet.Duracao_grad = 1
                    sheet.Duracao_array = listaFeiticos[k].duracaoArray

                    node.Grad = totable(listaFeiticos[k].gradArray)[1]
                    node.Grad_name = "Grad"
                    node.Grad_grad = 1
                    node.Grad_array = listaFeiticos[k].gradArray

                    node.CD = totable(listaFeiticos[k].cdfArray)[1]
                    node.CD_name = "CD"
                    node.CD_grad = 1
                    node.CD_array = listaFeiticos[k].cdfArray

                    node.Dano = totable(listaFeiticos[k].danoArray)[1]
                    node.Dano_name = "Dano"
                    node.Dano_grad = 1
                    node.Dano_array = listaFeiticos[k].danoArray

                    node.Poder = totable(listaFeiticos[k].poderArray)[1]
                    node.Poder_name = "Poder"
                    node.Poder_grad = 1
                    node.Poder_array = listaFeiticos[k].poderArray

                    node.Range = totable(listaFeiticos[k].rangeArray)[1]
                    node.Range_name = "Range"
                    node.Range_grad = 1
                    node.Range_array = listaFeiticos[k].rangeArray

                    node.Area = totable(listaFeiticos[k].areaArray)[1]
                    node.Area_name = "Area"
                    node.Area_grad = 1
                    node.Area_array = listaFeiticos[k].areaArray

                    node.Duracao = totable(listaFeiticos[k].duracaoArray)[1]
                    node.Duracao_name = "Duracao"
                    node.Duracao_grad = 1
                    node.Duracao_array = listaFeiticos[k].duracaoArray
                end
            end
        end
    end)
end

function feiticoScript.adicionarFeitico(self)
    local node = self.rclMagias:append()

    node.nome = "Importar"
    node.escola = "-"
    node.tipo = "-"
    node.Efeito = "-"

    node.Grad = 0
    node.Grad_name = "Grad"
    node.Grad_grad = 1
    node.Grad_array = {0}

    node.CD = "-"
    node.CD_name = "CD"
    node.CD_grad = 1
    node.CD_array = {0}

    node.Dano = "-"
    node.Dano_name = "Dano"
    node.Dano_grad = 1
    node.Dano_array = {"-"}

    node.Poder = "-"
    node.Poder_name = "Poder"
    node.Poder_grad = 1
    node.Poder_array = {"-"}

    node.Range = "-"
    node.Range_name = "Range"
    node.Range_grad = 1
    node.Range_array = {"-"}

    node.Area = "-"
    node.Area_name = "Area"
    node.Area_grad = 1
    node.Area_array = {"-"}

    node.Duracao = "-"
    node.Duracao_name = "Duracao"
    node.Duracao_grad = 1
    node.Duracao_array = {"-"}
end

return feiticoScript
