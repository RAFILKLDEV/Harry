require("utils.lua")
local talentos = {}

talentos.lista = {
    {campo = "talentoMaestria", nome = "Maestria em Feitiço", horas = 10,
     descricao = "Qualquer falha de conjuração passa a ser de estágio 1."},
    {campo = "talentoMaestriaSuperior", nome = "Maestria em Feitiço Superior", horas = 15,
     descricao = "Mínimo de ataque 10 + DES + GRAD, indicado na mensagem."},
    {campo = "talentoMenteCalma", nome = "Mente Calma", horas = 10,
     descricao = "Permite reduzir a CDF em 3 no lançamento, fora de combate."},
    {campo = "talentoSilencioso", nome = "Feitiço Silencioso", horas = 10,
     descricao = "A penalidade de lançar silenciosamente passa a ser −2."},
    {campo = "talentoCritico", nome = "Crítico Aprimorado", horas = 10,
     descricao = "Amplia a margem de crítico em 1, automaticamente."},
    {campo = "talentoAtaquePoderoso", nome = "Ataque Poderoso", horas = 20,
     descricao = "+1 fixo nos componentes numéricos de Dano e Poder existentes."},
    {campo = "talentoFeiticoPoderoso", nome = "Feitiço Poderoso",
     descricao = "Eleva o limite das melhorias temporárias de C4 para C10."}
}

function talentos.deCombate(node)
    return node.tipo == "Ataque" or node.tipo == "Ataque Base"
end

function talentos.limiteConcentracao(node)
    return node.talentoFeiticoPoderoso and 10 or 4
end

local function possuiComponente(node, campo)
    local valor = tonumber(node[campo])
    if valor ~= nil and valor ~= 0 then return true end
    local array = node[campo .. "_array"]
    if type(array) ~= "table" then
        local ok, parsed = pcall(totable, array)
        array = ok and parsed or nil
    end
    if type(array) == "table" then
        for _, item in ipairs(array) do
            local numero = tonumber(item)
            if numero ~= nil and numero ~= 0 then return true end
        end
    end
    return false
end

function talentos.valorEfetivo(node, campo, value)
    local numero = tonumber(value)
    if not node._talentosAplicados and node.talentoAtaquePoderoso and
        (campo == "Dano" or campo == "Poder") and numero ~= nil and possuiComponente(node, campo) then return numero + 1 end
    return value
end

function talentos.feiticoEfetivo(node)
    if node._talentosAplicados then return node end
    local copy = {_talentosAplicados = true}
    for _, campo in ipairs({"nome", "tipo", "escola", "defesa", "Grad", "CD", "Dano", "Poder", "Range", "Area", "Duracao", "Ataque", "Efeito", "Bonus", "tempo", "Tempo"}) do
        copy[campo] = talentos.valorEfetivo(node, campo, node[campo])
    end
    for _, talento in ipairs(talentos.lista) do copy[talento.campo] = node[talento.campo] == true end
    return copy
end

function talentos.estagiosDeFalha(node, estagios)
    return node.talentoMaestria and 1 or estagios
end

function talentos.minimoAtaque(node, root, penalidadeFisica)
    if not node.talentoMaestriaSuperior or (node.tipo ~= "Ataque" and node.tipo ~= "Ataque Base") then return nil end
    return 10 + (tonumber(root.DES) or 0) + (tonumber(node.Grad) or 0) +
        (tonumber(node.Ataque) or 0) - (tonumber(root.acerto) or 0) + (penalidadeFisica or 0)
end

function talentos.penalidadeSilenciosa(node, silencioso)
    if not silencioso then return 0 end
    return node.talentoSilencioso and -2 or -5
end

function talentos.margemCritico(node)
    return node.talentoCritico and 19 or 20
end

function talentos.d20Natural(rolagem)
    for _, operacao in ipairs(rolagem.ops or {}) do
        if operacao.tipo == "dado" and tonumber(operacao.face) == 20 then
            return tonumber((operacao.resultados or {})[1])
        end
    end
    return nil
end

function talentos.critico(node, rolagem)
    if node.nome == "Avada Kedrava" then return false end
    local natural = talentos.d20Natural(rolagem)
    return natural ~= nil and natural >= talentos.margemCritico(node)
end

return talentos
