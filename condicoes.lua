local NDB = require("ndb.lua")

local condicoes = {}
local atributosFisicos = {AGI = true, DES = true, FOR = true, LUT = true, VIG = true}
local atributosMentais = {INTE = true, PRE = true, SAB = true}

local function raiz(sheet)
    if sheet == nil then return nil end
    return NDB.getRoot(sheet) or sheet
end

function condicoes.tipoDoAtributo(atributo)
    if atributosFisicos[atributo] then return "fisico" end
    if atributosMentais[atributo] then return "mental" end
    return nil
end

-- Condições valem na ficha inteira. Usa somente a pior de cada grupo.
function condicoes.penalidade(sheet, tipo)
    local root = raiz(sheet)
    if root == nil then return 0 end

    if tipo == "fisico" then
        if root.Exausto then return -5 end
        if root.Fadigado or root.Fatigado then return -2 end
    elseif tipo == "mental" then
        if root.Tiltado then return -5 end
        if root.Frustrado then return -2 end
    end
    return 0
end

function condicoes.penalidadeDoAtributo(sheet, atributo)
    return condicoes.penalidade(sheet, condicoes.tipoDoAtributo(atributo))
end

-- Os campos numéricos Físico/Mental são exclusivos de treino e estudo.
function condicoes.penalidadeDeTreino(sheet, tipo)
    local root = raiz(sheet)
    if root == nil or (tipo ~= "fisico" and tipo ~= "mental") then return 0 end
    return -math.abs(tonumber(root[tipo]) or 0)
end

function condicoes.termo(valor)
    valor = tonumber(valor) or 0
    if valor == 0 then return "" end
    return (valor > 0 and "+" or "") .. tostring(valor)
end

return condicoes
