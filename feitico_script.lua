local Dialogs = require("dialogs.lua")
local NDB = require("ndb.lua")
local GUI = require("gui.lua")
local condicoes = require("condicoes.lua")
local lancamento = require("lancamento.lua")
local talentos = require("talentos.lua")
local mensagensMagia = require("mensagens_magia.lua")
require("utils.lua")

local feiticoScript = {}

local camposFeitico = {
    {campo = "Grad", nome = "Grad", array = "gradArray"},
    {campo = "CD", nome = "CD", array = "cdfArray"},
    {campo = "Dano", nome = "Dano", array = "danoArray"},
    {campo = "Poder", nome = "Poder", array = "poderArray"},
    {campo = "Range", nome = "Range", array = "rangeArray"},
    {campo = "Area", nome = "Area", array = "areaArray"},
    {campo = "Duracao", nome = "Duracao", array = "duracaoArray"}
}

local function normalizarNomeFeitico(nome)
    nome = tostring(nome or "")
    for _, par in ipairs({
        {"Á", "á"}, {"À", "à"}, {"Â", "â"}, {"Ã", "ã"},
        {"É", "é"}, {"Ê", "ê"}, {"Í", "í"},
        {"Ó", "ó"}, {"Ô", "ô"}, {"Õ", "õ"},
        {"Ú", "ú"}, {"Ü", "ü"}, {"Ç", "ç"}
    }) do
        nome = nome:gsub(par[1], par[2])
    end
    return nome:gsub("%s+", " "):match("^%s*(.-)%s*$"):lower()
end

local function prepararFeiticoBase(feitico)
    local preparado = {dados = feitico, valores = {}}

    for _, campo in ipairs(camposFeitico) do
        local valores = totable(feitico[campo.array])
        if type(valores) ~= "table" or #valores == 0 or valores[1] == nil then
            error("A lista " .. campo.array .. " do feitiço " .. tostring(feitico.nome) .. " está inválida.")
        end
        preparado.valores[campo.campo] = valores
    end

    return preparado
end

local function aplicarFeiticoBase(node, preparado)
    local dados = preparado.dados
    node.escola = dados.escola
    node.tipo = dados.cast
    node.tempo = dados.tempo
    node.defesa = dados.defesa
    node.Desc = dados.desc
    node.Efeito = dados.efeito
    node.Bonus = dados.bonus

    for _, campo in ipairs(camposFeitico) do
        local valores = preparado.valores[campo.campo]
        local indice = math.floor(tonumber(node[campo.campo .. "_grad"]) or 1)
        if indice < 1 or valores[indice] == nil then indice = 1 end

        node[campo.campo .. "_grad"] = indice
        node[campo.campo .. "_name"] = campo.nome
        node[campo.campo .. "_array"] = dados[campo.array]
        node[campo.campo] = valores[indice]
    end
end

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
    local penalidade = condicoes.penalidade(sheet, tipo)
    return penalidade ~= 0 and penalidade or nil
end

local function definirEscola(self, sheet, nodeOverride, rootOverride)
    local node = nodeOverride or getSpellNode(self, sheet)
    local root = rootOverride or getRootSheet(self, sheet)

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

local function stats(self, sheet, nodeOverride)
    local node = nodeOverride or getSpellNode(self, sheet)
    local partes = {}

    if node == nil then return "" end
    node = talentos.feiticoEfetivo(node)

    for _, campo in ipairs({{"Grad", "Graduação"}, {"CD", "CD"},
                            {"Dano", "Dano"}, {"Poder", "Poder"},
                            {"Range", "Alcance"}, {"Area", "Área"},
                            {"Duracao", "Duração"}, {"Ataque", "Ataque"}}) do
        local valor = textoChat(lancamento.formatarNumero(node[campo[1]]))
        local obrigatorio = campo[1] == "Grad" or campo[1] == "CD"
        if valor ~= "" and valor ~= "-" and
            (obrigatorio or tonumber(valor) ~= 0) then
            partes[#partes + 1] = "[§K10]" .. campo[2] .. ": [§K1]" .. valor
        end
    end

    return table.concat(partes, " [§K8]| ")
end

local function estatisticasCurtas(node, incluirBase)
    node = talentos.feiticoEfetivo(node)
    local partes = {}
    for _, campo in ipairs({{"Grad", "G"}, {"CD", "CD"}, {"Dano", "D"}, {"Poder", "P"},
                            {"Range", "Alc "}, {"Area", "Área "}, {"Duracao", "Dur "}}) do
        local base = campo[1] == "Grad" or campo[1] == "CD"
        local valor = textoChat(lancamento.formatarNumero(node[campo[1]]))
        if (incluirBase or not base) and valor ~= "" and valor ~= "-" and (base or tonumber(valor) ~= 0) then
            partes[#partes + 1] = campo[2] .. valor
        end
    end
    return table.concat(partes, " · ")
end

local function addSignedPart(parts, value)
    value = tonumber(value) or 0

    if value == 0 then return end

    if value > 0 then
        parts[#parts + 1] = "+" .. lancamento.formatarNumero(value)
    else
        parts[#parts + 1] = lancamento.formatarNumero(value)
    end
end

local function rolarLocal(expressao)
    local rolagem = rrpg.interpretarRolagem(expressao)
    rolagem:rolarLocalmente()
    return rolagem
end

local function isAttackSpell(node)
    return node ~= nil and (node.tipo == "Ataque" or node.tipo == "Ataque Base")
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

function feiticoScript.atualizarListaFeiticos(sheet)
    if sheet == nil or sheet.magias == nil then
        return nil, "Não foi possível localizar a lista de feitiços da ficha."
    end

    local raiz = NDB.load("listfetico.xml")
    if raiz == nil then
        return nil, "Não foi possível carregar a lista oficial de feitiços."
    end

    local baseDeFeiticos = NDB.getChildNodes(raiz)
    if baseDeFeiticos == nil or #baseDeFeiticos == 0 then
        return nil, "A lista oficial de feitiços está vazia."
    end

    local basePorNome = {}
    for _, feitico in ipairs(baseDeFeiticos) do
        local nome = normalizarNomeFeitico(feitico.nome)
        if nome ~= "" and basePorNome[nome] == nil then
            basePorNome[nome] = prepararFeiticoBase(feitico)
        end
    end

    local feiticosCadastrados = NDB.getChildNodes(sheet.magias) or {}
    local atualizados, naoEncontrados = 0, {}

    for _, feitico in ipairs(feiticosCadastrados) do
        local preparado = basePorNome[normalizarNomeFeitico(feitico.nome)]
        if preparado ~= nil then
            aplicarFeiticoBase(feitico, preparado)
            atualizados = atualizados + 1
        else
            naoEncontrados[#naoEncontrados + 1] = tostring(feitico.nome or "(sem nome)")
        end
    end

    return atualizados, naoEncontrados
end

function feiticoScript.atualizarFeiticos(self, sheet)
    Dialogs.showMessageDlg("Deseja atualizar sua lista de feitiços?",
        dialogs.DT_INFORMATION, {dialogs.DB_YES, dialogs.DB_NO}, function(escolha)
            if escolha == dialogs.DB_YES then
                local atualizados, naoEncontrados = feiticoScript.atualizarListaFeiticos(sheet)
                if atualizados == nil then
                    Dialogs.showErrorMessage(naoEncontrados)
                elseif atualizados == 0 then
                    Dialogs.showMessage("Não há feitiços cadastrados para atualizar.")
                elseif #naoEncontrados > 0 then
                    Dialogs.showMessage("Feitiços atualizados: " .. atualizados ..
                        "\nNão encontrados na lista oficial:\n" .. table.concat(naoEncontrados, "\n"))
                else
                    Dialogs.showMessage("Todos os " .. atualizados .. " feitiços foram atualizados!")
                end
            elseif escolha == dialogs.DB_NO then
                Dialogs.showMessage("Se não atualizar vai perder ponto")
            end
        end)
end

function feiticoScript.atualizarResumoTalentos(self, sheet)
    local node = getSpellNode(self, sheet)
    if node == nil or self.resumoTalentos == nil then return end
    local ativos = {}
    for _, talento in ipairs(talentos.lista) do
        if node[talento.campo] then ativos[#ativos + 1] = talento.nome end
    end
    local texto = #ativos > 0 and table.concat(ativos, " | ") or "Nenhum talento marcado para este feitiço."
    if node.talentoAtaquePoderoso then
        local efetivo = talentos.feiticoEfetivo(node)
        texto = texto .. " | Com Feitiço Potente — Dano: " .. lancamento.formatarNumero(efetivo.Dano) ..
                " / Poder: " .. lancamento.formatarNumero(efetivo.Poder)
    end
    self.resumoTalentos.text = texto
end

function feiticoScript.abrirTalentos(self, sheet)
    local node = getSpellNode(self, sheet)
    if node == nil then return end
    local popup = GUI.newPopupForm()
    popup.width, popup.height, popup.placement, popup.drawContainer = 570, 590, "center", true
    local layout = GUI.newLayout()
    layout.parent, layout.align, layout.margins = popup, "client", {left = 12, right = 12, top = 12, bottom = 12}
    local titulo = GUI.newLabel()
    titulo.parent, titulo.align, titulo.height = layout, "top", 32
    titulo.text, titulo.fontSize = "Talentos de " .. (node.nome or "Feitiço"), 18
    local ajuda = GUI.newLabel()
    ajuda.parent, ajuda.align, ajuda.height = layout, "top", 42
    ajuda.text = "Marque os talentos aprendidos para este feitiço. As escolhas ficam salvas."
    ajuda.wordWrap = true
    local fechar = GUI.newButton()
    fechar.parent, fechar.align, fechar.height, fechar.text = layout, "bottom", 35, "Fechar"
    fechar.onClick = function() popup:close() end
    local lista = GUI.newScrollBox()
    lista.parent, lista.align = layout, "client"
    for _, talento in ipairs(talentos.lista) do
        local opcao = talento
        local linha = GUI.newLayout()
        linha.parent, linha.align, linha.height = lista, "top", 70
        local check = GUI.newCheckBox()
        check.parent, check.align, check.height = linha, "top", 30
        check.text = opcao.nome .. (opcao.horas and " — " .. opcao.horas .. "h" or "")
        check.checked = node[opcao.campo] == true
        check.onChange = function()
            node[opcao.campo] = check.checked == true
            feiticoScript.atualizarResumoTalentos(self, sheet)
        end
        local descricao = GUI.newLabel()
        descricao.parent, descricao.align, descricao.height = linha, "top", 36
        descricao.text, descricao.fontSize = opcao.descricao, 12
        descricao.wordWrap = true
    end
    popup:show()
end

function feiticoScript.enviarFeiticoNaMesa(self, sheet)
    local node = getSpellNode(self, sheet)
    if node == nil then return false end

    local root = getRootSheet(self, sheet)
    local mesa = Firecast.getRoomOf(root)
    if mesa == nil or mesa.chat == nil then
        Dialogs.showMessage("Abra a ficha em uma mesa para enviar o feitiço.")
        return false
    end

    local nome = textoChat(node.nome)
    if nome == "" then nome = "Feitiço" end

    local cabecalho = {"[§K6]" .. nome, "[§K1]" .. estatisticasCurtas(node, true)}
    for _, campo in ipairs({"escola", "tipo"}) do
        local valor = textoChat(node[campo])
        if valor ~= "" and valor ~= "-" then cabecalho[#cabecalho + 1] = valor end
    end
    local mecanicas = {}
    for _, campo in ipairs({{"Bonus", "Bônus"}, {"defesa", "Testes"}}) do
        local valor = textoChat(node[campo[1]])
        if valor ~= "" and valor ~= "-" and valor ~= "0" then
            mecanicas[#mecanicas + 1] = campo[2] .. ": " .. valor
        end
    end
    local resumo = table.concat(cabecalho, " | ")
    if #mecanicas > 0 then resumo = resumo .. "\n[§K1]" .. table.concat(mecanicas, " | ") end
    mesa.chat:enviarMensagem(resumo)
    if self.popUp ~= nil then self.popUp.visible = false end
    return true
end

function feiticoScript.enviarCampoNaMesa(self, sheet, campo)
    local nomes = {Desc = "Descrição", Efeito = "Efeito", defesa = "Testes", Bonus = "Bônus"}
    local node = getSpellNode(self, sheet)
    if node == nil or nomes[campo] == nil then return false end
    local valor = textoChat(node[campo])
    if valor == "" or valor == "-" or valor == "0" then return false end
    local mesa = Firecast.getRoomOf(NDB.getRoot(node))
    if mesa == nil or mesa.chat == nil then return false end
    mesa.chat:enviarMensagem("[§K6]" .. textoChat(node.nome) .. " [§K8]| " .. nomes[campo] .. ": [§K1]" .. valor)
    return true
end

function feiticoScript.rolarFeitico(self, sheet, onFinish, opcoes)
    local node = opcoes and opcoes.node or getSpellNode(self, sheet)
    local root = opcoes and opcoes.root or getRootSheet(self, sheet)

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
    node = talentos.feiticoEfetivo(node)

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
    local grad = tonumber(node.Grad) or 0
    local conc = tonumber(opcoes and opcoes.concentracao or root.concentracao) or 0
    local mental = condition(root, "mental") or 0
    local silencio = talentos.penalidadeSilenciosa(node, opcoes and opcoes.silencioso)
    local escolaTotal = tonumber(definirEscola(self, sheet, node, root)) or 0
    local escola = math.floor(escolaTotal / 2)
    local partesRolagem = {"1d20"}

    -- Concentração já é descontada do teste; a comparação usa a CD base.
    addSignedPart(partesRolagem, grad)
    addSignedPart(partesRolagem, escola)
    addSignedPart(partesRolagem, -conc)
    addSignedPart(partesRolagem, mental)
    addSignedPart(partesRolagem, silencio)
    local minimoAtaque = talentos.minimoAtaque(node, root, condition(root, "fisico") or 0)
    local rolagem = rolarLocal(table.concat(partesRolagem, ""))
    local resultado = rolagem.resultado
    local conjurador = textoChat(root.nomePersonagem)
    if conjurador == "" then conjurador = textoChat(minhaMesa.meuJogador and minhaMesa.meuJogador.nick) end
    local mensagem = {
        nome = nome, personagem = conjurador, node = node, cd = cd, conjuracao = rolagem,
        criticoConjuracao = talentos.critico(node, rolagem),
        modificadoresConjuracao = {grad, escola, -conc, mental, silencio}, minimoAtaque = minimoAtaque
    }
    local function enviarResultado()
        local texto = mensagensMagia.formatar(mensagem)
        chat:enviarMensagem(mensagensMagia.separador)
        chat:enviarMensagem(texto)
    end
    if resultado < cd then
        -- Mantém os limites de estágios usados pela ficha: 5, 10 e 15.
        local estagios = math.min(4, math.floor((cd - resultado) / 5) + 1)
        estagios = talentos.estagiosDeFalha(node, estagios)
        mensagem.falha, mensagem.estagios = true, estagios
        enviarResultado()
        finalizarRolagem()
        return
    end

    if isAttackSpell(node) then
        local des = tonumber(root.DES) or 0
        local ataque = tonumber(node.Ataque) or 0
        local acerto = tonumber(root.acerto) or 0
        local fisico = condition(root, "fisico") or 0
        local partesAtaque = {"1d20"}

        addSignedPart(partesAtaque, grad)
        addSignedPart(partesAtaque, des)
        addSignedPart(partesAtaque, ataque)
        addSignedPart(partesAtaque, -acerto)
        addSignedPart(partesAtaque, fisico)
        local rolagemAtaque = rolarLocal(table.concat(partesAtaque, ""))
        local totalAtaque = tonumber(rolagemAtaque.resultado) or 0
        if minimoAtaque ~= nil then totalAtaque = math.max(totalAtaque, minimoAtaque) end
        mensagem.principal = {titulo = "ATAQUE", rolagem = rolagemAtaque,
            modificadores = {grad, des, ataque, -acerto, fisico}, final = totalAtaque,
            critico = talentos.critico(node, rolagemAtaque)}
        mensagem.minimoAplicado = minimoAtaque ~= nil and rolagemAtaque.resultado < minimoAtaque
        enviarResultado()
        finalizarRolagem()
    elseif node.tipo == "Defesa" then
        Dialogs.choose("Ataque corpo a corpo ou à distância?",
                       {"Distância", "Corpo-a-Corpo"},
                       function(selected, selectedIndex, selectedText)
            if not selected then
                enviarResultado()
                finalizarRolagem()
                return
            end

            local corpoACorpo = selectedText == "Corpo-a-Corpo"
            local defesaValor = tonumber(corpoACorpo and root.APA_Total or root.REF_Total) or 0
            local poder = tonumber(node.Poder) or 0
            local mod = condition(root, "fisico") or 0
            local partesDefesa = {"1d8"}
            addSignedPart(partesDefesa, 10)
            addSignedPart(partesDefesa, poder)
            addSignedPart(partesDefesa, defesaValor)
            addSignedPart(partesDefesa, mod)
            local defesa = rolarLocal(table.concat(partesDefesa, ""))
            mensagem.principal = {titulo = "DEFESA", rolagem = defesa, modificadores = {10, poder, defesaValor, mod}}
            enviarResultado()
            finalizarRolagem()
        end, 1)
    elseif nome:lower() == "muro fictus" then
        local furtividade = tonumber(root.FUR_Total) or 0
        local fisico = condition(root, "fisico") or 0
        local partesFurtividade = {"1d20"}
        addSignedPart(partesFurtividade, furtividade)
        addSignedPart(partesFurtividade, fisico)
        mensagem.principal = {titulo = "FURTIVIDADE", rolagem = rolarLocal(table.concat(partesFurtividade, "")),
            modificadores = {furtividade, fisico}}
        enviarResultado()
        finalizarRolagem()
    else
        enviarResultado()
        finalizarRolagem()
    end
end

function feiticoScript.abrirPopupFeitico(self, sheet)
    local node = getSpellNode(self, sheet)

    if node == nil then return end
    local root = NDB.getRoot(node)
    local estado = lancamento.novo(node)

    local popup = GUI.newPopupForm()
    popup.width = 420
    popup.height = 540
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

    local lblConc = GUI.newLabel()
    lblConc.parent = layout
    lblConc.align = "top"
    lblConc.height = 25
		lblConc.fontSize = 18
    lblConc.horzTextAlign = "center"

    local controles = {}
    local lblTemporario = GUI.newLabel()
    lblTemporario.parent, lblTemporario.align, lblTemporario.height = layout, "top", 32
    local menteCalma, silencioso
    local function atualizarControles()
        lblConc.text = "Concentração temporária: C" .. lancamento.formatarNumero(estado:concentracao()) .. " / C" .. estado:limite()
        for _, controle in ipairs(controles) do
            controle.valor.text = lancamento.formatarNumero(estado.preview[controle.field])
            controle.mais.enabled = estado:podeAumentar(controle.field)
            controle.menos.enabled = estado:podeDiminuir(controle.field)
        end
        lblTemporario.text = "CDF deste lançamento: " .. lancamento.formatarNumero(estado.preview.CD) ..
            (estado.menteCalma and " (Mente Calma −3)" or "") ..
            (estado.silencioso and " | Silêncio " .. estado:penalidadeSilenciosa() or "")
    end

    if estado.preview.talentoMenteCalma then
        menteCalma = GUI.newCheckBox()
        menteCalma.parent, menteCalma.align, menteCalma.height = layout, "top", 30
        menteCalma.text, menteCalma.checked = "Usar Mente Calma (CDF −3)", false
        menteCalma.enabled = estado:podeUsarMenteCalma()
        menteCalma.hint = "Somente neste lançamento. Indisponível para feitiços de combate."
        menteCalma.onChange = function()
            estado:definirMenteCalma(menteCalma.checked)
            atualizarControles()
        end
    end
    silencioso = GUI.newCheckBox()
    silencioso.parent, silencioso.align, silencioso.height = layout, "top", 30
    silencioso.text = "Lançar silenciosamente (" .. talentos.penalidadeSilenciosa(estado.preview, true) .. ")"
    silencioso.checked = false
    silencioso.onChange = function()
        estado:definirSilencioso(silencioso.checked)
        atualizarControles()
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
        btnMenos.hint = "Desfaz apenas os aumentos desta abertura; não reduz o valor original."

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
        btnMais.hint = "Cada aumento custa 2 de concentração temporária, até C" .. estado:limite() .. "."
        controles[#controles + 1] = {field = field, valor = valor, mais = btnMais, menos = btnMenos}

        btnMais.onClick = function()
            estado:aumentar(field)
            atualizarControles()
        end

        btnMenos.onClick = function()
            estado:diminuir(field)
            atualizarControles()
        end
    end

    for _, field in ipairs(estado.campos) do criarCampo(field, field) end
    atualizarControles()

    local btnRolar = GUI.newButton()
    btnRolar.parent = layout
    btnRolar.align = "bottom"
    btnRolar.height = 40
    btnRolar.text = "ROLAR FEITIÇO"

    btnRolar.onClick = function()
        feiticoScript.rolarFeitico(self, sheet, nil, {
            node = estado.preview, root = root, concentracao = estado:concentracao(), silencioso = estado.silencioso
        })
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
                    sheet.tempo = listaFeiticos[k].tempo
                    sheet.Efeito = listaFeiticos[k].efeito
                    sheet.Bonus = listaFeiticos[k].bonus
                    sheet.Desc = listaFeiticos[k].desc

                    node.nome = listaFeiticos[k].nome
                    node.escola = listaFeiticos[k].escola
                    node.defesa = listaFeiticos[k].defesa
                    node.tipo = listaFeiticos[k].cast
                    node.tempo = listaFeiticos[k].tempo
                    node.Efeito = listaFeiticos[k].efeito
                    node.Bonus = listaFeiticos[k].bonus
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
    node.Bonus = "-"

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
