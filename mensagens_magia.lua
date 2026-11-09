local lancamento = require("lancamento.lua")
local mensagens = {}

-- RGB nativo: https://github.com/rrpgfirecast/firecast/blob/master/Macros/Storytelling/v5.lua
mensagens.cores = {branco = "[§K#F8FAFC]", ciano = "[§K#67E8F9]", vermelho = "[§K#FF6B7A]",
                   amarelo = "[§K#FFE066]", verde = "[§K#6EE7A0]", rosa = "[§K#F9A8D4]",
                   lavanda = "[§K#C4B5FD]", azul = "[§K#93C5FD]", pessego = "[§K#FDBA74]",
                   suave = "[§K#CBD5E1]", dourado = "[§K#F2C94C]"}
mensagens.separador = "------------------------------------"
local cor = mensagens.cores

local function texto(value)
    local valueText = tostring(value or ""):gsub("%[§[^%]]*%]", "")
    valueText = valueText:gsub("&#[xX]20;", " "):gsub("&#32;", " "):gsub("&nbsp;", " ")
    return (valueText:gsub("%s+", " "):match("^%s*(.-)%s*$"))
end

local function numero(value)
    return lancamento.formatarNumero(value):gsub("(%d)%.(%d)", "%1,%2")
end

local function presente(value)
    local normalized = texto(value)
    return normalized ~= "" and normalized ~= "-" and tonumber(normalized) ~= 0
end

function mensagens.calculo(titulo, rolagem, modificadores, final)
    modificadores = modificadores or {}
    local base, encontrouDado, somaModificadores = 0, false, 0
    for _, operacao in ipairs(rolagem.ops or {}) do
        if operacao.tipo == "dado" then
            for _, value in ipairs(operacao.resultados or {}) do
                base = base + (tonumber(value) or 0)
                encontrouDado = true
            end
        end
    end
    for _, value in ipairs(modificadores) do somaModificadores = somaModificadores + (tonumber(value) or 0) end
    -- As expressões atuais são dado + parcelas. Preserva o total do motor mesmo
    -- quando um adaptador não fornece ops; nunca faz uma nova rolagem.
    local total = tonumber(rolagem.resultado) or 0
    if not encontrouDado then base = total - somaModificadores end
    local partes = {cor.azul .. texto(titulo) .. ": " .. cor.branco .. numero(base)}
    for _, value in ipairs(modificadores) do
        value = tonumber(value) or 0
        if value > 0 then partes[#partes + 1] = cor.ciano .. "+" .. numero(value)
        elseif value < 0 then partes[#partes + 1] = cor.vermelho .. numero(value) end
    end
    local resultado = tonumber(final) or total
    local linha = table.concat(partes, " ") .. cor.branco .. " = "
    if resultado ~= total then linha = linha .. numero(total) .. " → " end
    return linha .. cor.amarelo .. numero(resultado) .. cor.branco
end

local function extras(contexto)
    local node, partes = contexto.node or {}, {}
    local function adicionar(value, tonalidade)
        if presente(value) then partes[#partes + 1] = (tonalidade or cor.suave) .. texto(value) .. cor.branco end
    end
    if contexto.minimoAtaque ~= nil then
        adicionar(contexto.minimoAplicado and "Maestria Superior (mín.)" or
                  "Maestria Superior (mín. " .. numero(contexto.minimoAtaque) .. ")", cor.pessego)
    end
    if contexto.falha and node.talentoMaestria then adicionar("Maestria", cor.pessego) end
    if contexto.falha then return #partes > 0 and cor.branco .. table.concat(partes, " · ") or nil end
    for _, campo in ipairs({{"Dano", "Dano "}, {"Poder", "Poder "}}) do
        local jaMostrado = campo[1] == "Poder" and contexto.principal and contexto.principal.titulo == "DEFESA"
        if not jaMostrado and presente(node[campo[1]]) then adicionar(campo[2] .. numero(node[campo[1]]), cor.pessego) end
    end
    if presente(node.Range) then adicionar((texto(node.Range):gsub("(%d)%.(%d)", "%1,%2"))) end
    if presente(node.Area) then adicionar("Área " .. numero(node.Area)) end
    adicionar(node.tempo or node.Tempo)
    adicionar(node.defesa, cor.lavanda)
    if presente(node.Bonus) then adicionar("Bônus " .. texto(node.Bonus), cor.azul) end
    return #partes > 0 and cor.branco .. table.concat(partes, " · ") or nil
end

function mensagens.formatar(contexto)
    local nome = texto(contexto.nome)
    if nome == "" then nome = "Feitiço" end
    local personagem = texto(contexto.personagem)
    if personagem == "" then personagem = "Conjurador" end
    local status = contexto.falha and cor.vermelho .. "✗ Falha" or cor.verde .. "✓ Sucesso"
    if contexto.falha and contexto.estagios then
        status = status .. " (" .. numero(contexto.estagios) .. (contexto.estagios == 1 and " estágio)" or " estágios)")
    end
    local linhas = {cor.lavanda .. nome .. cor.branco .. " · " .. cor.rosa .. personagem .. cor.branco .. " · " .. status .. cor.branco}
    linhas[#linhas + 1] = mensagens.calculo("Conj", contexto.conjuracao, contexto.modificadoresConjuracao) ..
                          " | " .. cor.lavanda .. "CD " .. numero(contexto.cd) .. cor.branco
    if contexto.criticoConjuracao then
        linhas[#linhas] = linhas[#linhas] .. " | " .. cor.dourado .. "Crítico!" .. cor.branco
    end
    if contexto.principal then
        local principal = contexto.principal
        local linha = mensagens.calculo(principal.titulo, principal.rolagem, principal.modificadores, principal.final)
        if principal.critico then linha = linha .. " | " .. cor.dourado .. "Crítico!" .. cor.branco end
        linhas[#linhas + 1] = linha
    end
    local detalhe = extras(contexto)
    if detalhe then linhas[#linhas + 1] = detalhe end
    return table.concat(linhas, "\n")
end

return mensagens
