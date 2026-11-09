require("utils.lua")
local talentos = require("talentos.lua")
local lancamento = {limiteConcentracao = 4, custoPorAumento = 2}
local campos = {"Dano", "Area", "Range", "Duracao", "Poder"}

function lancamento.formatarNumero(value)
    local numero = tonumber(value)
    if numero == nil or numero ~= numero or numero == math.huge or numero == -math.huge then
        return tostring(value or "")
    end
    if numero == 0 then return "0" end
    if numero % 1 == 0 then return string.format("%.0f", numero) end
    return tostring(numero)
end

local function lerArray(value)
    if value == nil then return {} end
    local ok, array = true, value
    if type(value) ~= "table" then ok, array = pcall(totable, value) end
    if not ok or type(array) ~= "table" then return {} end
    local copy = {}
    for index, item in ipairs(array) do copy[index] = item end
    return copy
end

local estado = {}
estado.__index = estado

function estado:limite()
    return talentos.limiteConcentracao(self.preview)
end

function estado:concentracao()
    local aumentos = 0
    for field, initial in pairs(self.iniciais) do
        aumentos = aumentos + math.max(0, self.preview[field .. "_grad"] - initial.grad)
    end
    return aumentos * lancamento.custoPorAumento
end

function estado:podeAumentar(field)
    local initial, array = self.iniciais[field], self.arrays[field]
    if initial == nil then return false end
    local grad = self.preview[field .. "_grad"]
    if grad < initial.grad or array[grad + 1] == nil or
        self:concentracao() + lancamento.custoPorAumento > self:limite() then return false end
    local atual, proximo = tonumber(self.preview[field]), tonumber(array[grad + 1])
    -- Uma ficha com valor manual acima da tabela não pode ser reduzida pelo +.
    return atual == nil or proximo == nil or proximo >= atual
end

function estado:aumentar(field)
    if not self:podeAumentar(field) then return false end
    local grad = self.preview[field .. "_grad"] + 1
    self.preview[field .. "_grad"], self.preview[field] = grad, self.arrays[field][grad]
    return true
end

function estado:podeDiminuir(field)
    local initial = self.iniciais[field]
    return initial ~= nil and self.preview[field .. "_grad"] > initial.grad
end

function estado:diminuir(field)
    if not self:podeDiminuir(field) then return false end
    local grad = self.preview[field .. "_grad"] - 1
    self.preview[field .. "_grad"] = grad
    self.preview[field] = grad == self.iniciais[field].grad and self.iniciais[field].valor or self.arrays[field][grad]
    return true
end

function estado:podeUsarMenteCalma()
    return self.preview.talentoMenteCalma and not talentos.deCombate(self.preview) and tonumber(self.cdOriginal) ~= nil
end

function estado:definirMenteCalma(usar)
    self.menteCalma = usar == true and self:podeUsarMenteCalma() or false
    self.preview.CD = self.menteCalma and math.max(0, tonumber(self.cdOriginal) - 3) or self.cdOriginal
end

function estado:definirSilencioso(usar)
    self.silencioso = usar == true
end

function estado:penalidadeSilenciosa()
    return talentos.penalidadeSilenciosa(self.preview, self.silencioso)
end

function lancamento.novo(node)
    local self = setmetatable({preview = {}, iniciais = {}, arrays = {}, campos = {}, menteCalma = false, silencioso = false, cdOriginal = node.CD}, estado)
    for _, field in ipairs({"nome", "tipo", "escola", "defesa", "Grad", "CD", "Dano", "Area", "Range", "Duracao", "Poder", "Ataque", "Efeito", "Bonus", "tempo", "Tempo"}) do
        self.preview[field] = node[field]
    end
    for _, talento in ipairs(talentos.lista) do self.preview[talento.campo] = node[talento.campo] == true end
    self.preview._talentosAplicados = true

    local function adicionar(field, array)
        local grad = tonumber(node[field .. "_grad"])
        if grad == nil then
            for index, value in ipairs(array) do
                if value == node[field] or (tonumber(value) ~= nil and tonumber(value) == tonumber(node[field])) then
                    grad = index
                    break
                end
            end
        end
        grad = math.max(1, math.floor(grad or 1))
        local value = node[field]
        if value == nil then value = array[grad] or 0 end
        value = talentos.valorEfetivo(node, field, value)
        for index, item in ipairs(array) do array[index] = talentos.valorEfetivo(node, field, item) end
        self.preview[field], self.preview[field .. "_grad"] = value, grad
        self.iniciais[field], self.arrays[field] = {valor = value, grad = grad}, array
        if #array > 1 then self.campos[#self.campos + 1] = field end
    end
    for _, field in ipairs(campos) do adicionar(field, lerArray(node[field .. "_array"])) end
    if node.tipo == "Ataque" or node.tipo == "Ataque Base" then
        local ataque = {}
        for value = 0, 20 do ataque[#ataque + 1] = value end
        adicionar("Ataque", ataque)
    end
    return self
end

return lancamento
