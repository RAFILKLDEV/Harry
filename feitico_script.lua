local Dialogs = require("dialogs.lua")
local NDB = require("ndb.lua")
local GUI = require("gui.lua")
require("utils.lua")

local feiticoScript = {}

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
    local node = self.rclMagias.selectedNode

    if node == nil then return nil end

    if node.escola == "Adivinhação" then
        return sheet.C_ADI_Total
    elseif node.escola == "Azaração" then
        return sheet.C_AZA_Total
    elseif node.escola == "Contra-Feitiço" then
        return sheet.C_CON_Total
    elseif node.escola == "Encantamento" then
        return sheet.C_ENC_Total
    elseif node.escola == "Feitiço" then
        return sheet.C_FEI_Total
    elseif node.escola == "Transmutação" then
        return sheet.C_TRA_Total
    elseif node.escola == "Maldição" then
        return sheet.C_MAL_Total
    end

    return nil
end

local function stats(self)
    local node = self.rclMagias.selectedNode
    local msg = ""

    if node == nil then return msg end

    if node.Grad ~= "" then
        msg = msg .. "[§K10]" .. "Grad: " .. "[§K1]" .. (node.Grad or "")
    end

    if node.CD ~= "" then
        msg = msg .. "[§K10]" .. " CD: " .. "[§K1]" .. (node.CD or "")
    end

    if node.Dano ~= "" then
        msg = msg .. "[§K10]" .. " Dano: " .. "[§K1]" .. (node.Dano or "")
    end

    if node.Poder ~= "" then
        msg = msg .. "[§K10]" .. " Poder: " .. "[§K1]" .. (node.Poder or "")
    end

    if node.Range ~= "" then
        msg = msg .. "[§K10]" .. " Range: " .. "[§K1]" .. (node.Range or "")
    end

    if node.Area ~= "" then
        msg = msg .. "[§K10]" .. " Area: " .. "[§K1]" .. (node.Area or "")
    end

    if node.Duracao ~= "" then
        msg = msg .. "[§K10]" .. " Duração: " .. "[§K1]" ..
                  (node.Duracao or "")
    end

    return msg
end

local function formatMod(v)
    if v == nil or v == 0 then return "" end

    if v > 0 then return "+" .. v end

    return tostring(v)
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
        details[#details + 1] = "[§K8] " .. label .. " [§K1]+" .. value
    else
        details[#details + 1] = "[§K8] " .. label .. " [§K1]" .. value
    end
end

local function calcularConc(preview)
    local graduacoes = (preview.CD_grad - 1) + (preview.Poder_grad - 1) +
                           (preview.Dano_grad - 1) +
                           (preview.Range_grad - 1) +
                           (preview.Area_grad - 1) +
                           (preview.Duracao_grad - 1)

    local excesso = graduacoes - preview.Grad

    if excesso > 0 then return excesso * 2 end

    return 0
end

local function copiarEstado(node, preview)
    local original = {}

    for k, _ in pairs(preview) do original[k] = node[k] end

    return original
end

function feiticoScript.abrirPopUp(self, sheet)
    local controle = self:findControlByName("popUp")

    if controle ~= nil then controle.visible = true end

    local raiz = NDB.load("listfetico.xml")
    local filhos = NDB.getChildNodes(raiz)
    local root = NDB.getRoot(sheet)

    local listaFeiticos = {}
    local listaNomesFeitico = {}

    for i = 1, #filhos, 1 do
        listaFeiticos[i] = raiz["f" .. i]
        listaNomesFeitico[i] = raiz["f" .. i].nome
        table.sort(listaNomesFeitico)
    end

    for k = 1, #filhos, 1 do
        if sheet.nome == listaFeiticos[k].nome then
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

            root.escola = sheet.escola
            root.tipo = sheet.tipo
            root.Grad = sheet.Grad
            root.CD = sheet.CD
            root.Dano = sheet.Dano
            root.Poder = sheet.Poder
            root.Range = sheet.Range
            root.Area = sheet.Area
            root.Duracao = sheet.escola

            root.Desc = listaFeiticos[k].desc
            root.Efeito = listaFeiticos[k].efeito
            root.Bonus = listaFeiticos[k].bonus
        end
    end
end

function feiticoScript.condition(sheet, tipo) return condition(sheet, tipo) end

function feiticoScript.testezz(sheet)
    local node = NDB.getRoot(sheet)
    showMessage(node.soundControl)
end

function feiticoScript.tocarAudio(sheet)
    local minhaMesa = Firecast.getRoomOf(sheet)
    local node = NDB.getRoot(sheet)

    if node.soundControl == "ligado" and sheet.Sound ~= nil then
        local track = "/audios/" .. sheet.Sound
        minhaMesa.audioPlayer:play(track, 0.8)
    end
end

function feiticoScript.Aceitar(self)
    Dialogs.confirmOkCancel("Deseja Apagar esse Feitiço ?",
                            function(confirmado)
        if confirmado then
            local node = self.boxDetalhesDoItem.node
            NDB.deleteNode(node)
        end
    end)
end

function feiticoScript.definirEscola(self, sheet)
    return definirEscola(self, sheet)
end

function feiticoScript.stats(self) return stats(self) end

function feiticoScript.rolarFeitico(self, sheet, onFinish)
    local minhaMesa = Firecast.getRoomOf(sheet)
    local chat = minhaMesa.chat
    local root = NDB.getRoot(sheet)
    local nick = root.nomePersonagem or minhaMesa.meuJogador.nick
    local node = self.rclMagias.selectedNode
    local defesaTipo = "Distancia"
    local defesaValor = 0

    local function finalizarRolagem()
        if onFinish then
            onFinish()
            onFinish = nil
        end
    end

    if node == nil then
        finalizarRolagem()
        return
    end

    if sheet.mental == nil then sheet.mental = 0 end

    local grad = tonumber(node.Grad) or 0
    local conc = tonumber(root.concentracao)
    if conc == nil then conc = tonumber(sheet.concentracao) or 0 end
    local mental = tonumber(condition(sheet, "mental") or 0) or 0
    local escolaTotal = tonumber(definirEscola(self, sheet) or 0) or 0
    local escola = math.floor(escolaTotal / 2)
    local partesRolagem = {"1d20"}
    local detalhesRolagem = {}

    addSignedPart(partesRolagem, grad)
    addSignedPart(partesRolagem, escola)
    addSignedPart(partesRolagem, -conc)
    addSignedPart(partesRolagem, mental)

    addRollDetail(detalhesRolagem, "Grad", grad)
    addRollDetail(detalhesRolagem, "Escola", escola)
    addRollDetail(detalhesRolagem, "Concentração", -conc)
    addRollDetail(detalhesRolagem, "Mental", mental)

    local somatoria = table.concat(partesRolagem, "")
    local mensagemRolagem = (node.nome or "Feitiço")
    local resumoRolagem = table.concat(detalhesRolagem, " ")

    if resumoRolagem ~= "" then
        mensagemRolagem = mensagemRolagem .. " " .. resumoRolagem
    end

    chat:enviarMensagem("----------------")

    chat:rolarDados(somatoria, mensagemRolagem, function(rolagem)
        if rolagem.resultado >= tonumber(node.CD) then
            chat:enviarMensagem("[§K10]" .. nick ..
                                    "[§K1] esta castando [§K6]" .. node.nome ..
                                    "[§K10] CD [§K1]" .. tonumber(node.CD + conc) .. " = [§K7]" .. (conc and node.CD .. " + [§K4]" .. conc or "" ) ..
                                    "[§K1] =[§K9] Sucesso!")
            chat:enviarMensagem("[§K6]" .. node.nome .. " " .. stats(self))
            chat:enviarMensagem("[§K1] Testes: [§K10]" .. (node.defesa or ""))

            if node.tipo == "Ataque" then
                chat:rolarDados("1d20+" .. node.Grad .. "+" .. sheet.DES ..
                                    (sheet.acerto and sheet.acerto ~= 0 and
                                        ("-" .. sheet.acerto) or "") ..
                                    (condition(sheet, "fisico") or ""),

                                "[§K8] Grad [§K1]" .. node.Grad ..
                                    "[§K8] Des [§K1]" .. sheet.DES ..
                                    (sheet.acerto and sheet.acerto ~= 0 and
                                        ("[§K8] Acerto [§K1]-" .. sheet.acerto) or
                                        "") .. (condition(sheet, "fisico") and
                                    ("[§K8] Fisico [§K1]" ..
                                        condition(sheet, "fisico")) or ""),
                                function() finalizarRolagem() end)

            elseif node.tipo == "Ataque Base" then
                chat:rolarDados("1d20+" .. node.Grad .. "+" .. sheet.DES ..
                                    ((sheet.acerto ~= 0) and
                                        ("-" .. sheet.acerto) or "") ..
                                    (condition(sheet, "fisico") or ""),

                                "[§K8] Grad [§K1]" .. node.Grad ..
                                    "[§K8] Des [§K1]" .. sheet.DES ..
                                    (sheet.acerto and sheet.acerto ~= 0 and
                                        ("[§K8] Acerto [§K1]-" .. sheet.acerto) or
                                        "") .. (condition(sheet, "fisico") and
                                    ("[§K8] Fisico [§K1]" ..
                                        condition(sheet, "fisico")) or ""),
                                function() finalizarRolagem() end)

            elseif node.tipo == "Defesa" then
                Dialogs.choose("Ataque Corpo-a-Corpo ou a Distancia ?",
                               {"Corpo-a-Corpo", "Distancia"},
                               function(selected, selectedIndex, selectedText)
                    if not selected then
                        finalizarRolagem()
                        return
                    end

                    local nodeMain = NDB.getRoot(sheet)

                    if selectedText == "Corpo-a-Corpo" then
                        defesaValor = tonumber(nodeMain.APA_Total) or 0
                        defesaTipo = "Corpo-a-Corpo"
                    elseif selectedText == "Distancia" then
                        defesaValor = tonumber(nodeMain.REF_Total) or 0
                        defesaTipo = "Distancia"
                    end

                    local mod = condition(sheet, "fisico") or 0

                    chat:rolarDados(
                        "1d8+" .. node.Poder .. "+" .. defesaValor .. "+10" ..
                            (mod >= 0 and "+" .. mod or mod),
                        "CA " .. node.nome .. " " .. tostring(defesaTipo),
                        function() finalizarRolagem() end)
                end)
            else
                finalizarRolagem()
            end

            chat:enviarMensagem("----------------")

        elseif rolagem.resultado > tonumber(node.CD) - 5 then
            chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome ..
                                    "[§K1] CD [§K7]" .. node.CD ..
                                    "[§K4] Falhou em 1 Estágio!!")
            finalizarRolagem()

        elseif rolagem.resultado > tonumber(node.CD) - 10 then
            chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome ..
                                    "[§K1] CD [§K7]" .. node.CD ..
                                    "[§K4] Falhou em 2 Estágio!!")
            finalizarRolagem()

        elseif rolagem.resultado > tonumber(node.CD) - 15 then
            chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome ..
                                    "[§K1] CD [§K7]" .. node.CD ..
                                    "[§K4] Falhou em 3 Estágio!!")
            finalizarRolagem()

        else
            chat:enviarMensagem("[§K11]" .. nick .. " - [§K6]" .. node.nome ..
                                    "[§K1] CD [§K7]" .. node.CD ..
                                    "[§K4] Falhou em 4 Estágio!!")
            finalizarRolagem()
        end
    end)
end

function feiticoScript.abrirPopupFeitico(self, sheet)
    local node = self.rclMagias.selectedNode

    if node == nil then return end

    local popup = GUI.newPopupForm()
    popup.width = 320
    popup.height = 360
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

    local function valorInicialPopup(field)
        local grad = tonumber(node[field .. "_grad"]) or 1
        local array = totable(node[field .. "_array"])

        if array and array[grad] ~= nil then return array[grad] end

        return node[field] or 0
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

    local function criarCampo(nome, field)
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
            local array = totable(node[field .. "_array"])
            local grad = preview[field .. "_grad"] or 1

            if grad < #array then
                grad = grad + 1
                preview[field .. "_grad"] = grad
                preview[field] = array[grad]
            end

            atualizarValor()
            atualizarConc()
        end

        btnMenos.onClick = function()
            local array = totable(node[field .. "_array"])
            local grad = preview[field .. "_grad"] or 1

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

    atualizarConc()

    local btnRolar = GUI.newButton()
    btnRolar.parent = layout
    btnRolar.align = "bottom"
    btnRolar.height = 40
    btnRolar.text = "ROLAR FEITIÇO"

    btnRolar.onClick = function()
        local original = copiarEstado(node, preview)
        local root = NDB.getRoot(sheet)
        local concOriginal = tonumber(root.concentracao or sheet.concentracao or
                                          0) or 0

        for k, v in pairs(preview) do
            node[k] = v
            sheet[k] = v
        end

        local conc = atualizarConc()
        sheet.concentracao = conc
        root.concentracao = conc

        feiticoScript.rolarFeitico(self, sheet, function()
            for k, v in pairs(original) do
                node[k] = v
                sheet[k] = v
            end

            sheet.concentracao = concOriginal
            root.concentracao = concOriginal
        end)

        popup:close()
    end

    popup:show()
end

function feiticoScript.ListaDeFeitico(self, sheet)
    local raiz = NDB.load("listfetico.xml")
    local filhos = NDB.getChildNodes(raiz)
    local node = self.rclMagias.selectedNode

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
