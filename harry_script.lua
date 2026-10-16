local harryScript = {}

local function cadaDez(numero)
    local result = -1

    while numero >= 0 do
        result = result + 1
        numero = numero - 10
    end

    return result
end

function harryScript.onSheetChange(sheet)
    if sheet == nil then return end

    sheet.ACR_Total = (tonumber(sheet.ACR_Grad) or 0) +
                          (tonumber(sheet.AGI) or 0) +
                          (tonumber(sheet.ACR_Out) or 0)

    sheet.ATL_Total = (tonumber(sheet.ATL_Grad) or 0) +
                          (tonumber(sheet.FOR) or 0) +
                          (tonumber(sheet.ATL_Out) or 0)

    sheet.COR_Total = (tonumber(sheet.COR_Grad) or 0) +
                          (tonumber(sheet.LUT) or 0) +
                          (tonumber(sheet.COR_Out) or 0)

    sheet.FUR_Total = (tonumber(sheet.FUR_Grad) or 0) +
                          (tonumber(sheet.AGI) or 0) +
                          (tonumber(sheet.FUR_Out) or 0)

    sheet.PRE_Total = (tonumber(sheet.PRE_Grad) or 0) +
                          (tonumber(sheet.DES) or 0) +
                          (tonumber(sheet.PRE_Out) or 0)

    sheet.VEI_Total = (tonumber(sheet.VEI_Grad) or 0) +
                          (tonumber(sheet.AGI) or 0) +
                          (tonumber(sheet.VEI_Out) or 0)

    sheet.CON_Total = (tonumber(sheet.CON_Grad) or 0) +
                          (tonumber(sheet.SAB) or 0) +
                          (tonumber(sheet.CON_Out) or 0)

    sheet.ENG_Total = (tonumber(sheet.ENG_Grad) or 0) +
                          (tonumber(sheet.PRE) or 0) +
                          (tonumber(sheet.ENG_Out) or 0)

    sheet.INT_Total = (tonumber(sheet.INT_Grad) or 0) +
                          (tonumber(sheet.PRE) or 0) +
                          (tonumber(sheet.INT_Out) or 0)

    sheet.INTU_Total = (tonumber(sheet.INTU_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.INTU_Out) or 0)

    sheet.INV_Total = (tonumber(sheet.INV_Grad) or 0) +
                          (tonumber(sheet.INTE) or 0) +
                          (tonumber(sheet.INV_Out) or 0)

    sheet.PERC_Total = (tonumber(sheet.PERC_Grad) or 0) +
                           (tonumber(sheet.SAB) or 0) +
                           (tonumber(sheet.PERC_Out) or 0)

    sheet.PERS_Total = (tonumber(sheet.PERS_Grad) or 0) +
                           (tonumber(sheet.PRE) or 0) +
                           (tonumber(sheet.PERS_Out) or 0)

    sheet.TRA_Total = (tonumber(sheet.TRA_Grad) or 0) +
                          (tonumber(sheet.INTE) or 0) +
                          (tonumber(sheet.TRA_Out) or 0)

    sheet.ATU_Total = (tonumber(sheet.ATU_Grad) or 0) +
                          (tonumber(sheet.INTE) or 0) +
                          (tonumber(sheet.ATU_Out) or 0)

    sheet.C_ADI_Total = (tonumber(sheet.C_ADI_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_ADI_Out) or 0)

    sheet.C_AZA_Total = (tonumber(sheet.C_AZA_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_AZA_Out) or 0)

    sheet.C_CON_Total = (tonumber(sheet.C_CON_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_CON_Out) or 0)

    sheet.C_CRI_Total = (tonumber(sheet.C_CRI_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_CRI_Out) or 0)

    sheet.C_ENC_Total = (tonumber(sheet.C_ENC_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_ENC_Out) or 0)

    sheet.C_FEI_Total = (tonumber(sheet.C_FEI_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_FEI_Out) or 0)

    sheet.C_HER_Total = (tonumber(sheet.C_HER_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_HER_Out) or 0)

    sheet.C_MAL_Total = (tonumber(sheet.C_MAL_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_MAL_Out) or 0)

    sheet.C_POC_Total = (tonumber(sheet.C_POC_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_POC_Out) or 0)

    sheet.C_RUN_Total = (tonumber(sheet.C_RUN_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_RUN_Out) or 0)

    sheet.C_TRA_Total = (tonumber(sheet.C_TRA_Grad) or 0) +
                            (tonumber(sheet.INTE) or 0) +
                            (tonumber(sheet.C_TRA_Out) or 0)

    sheet.INI_Total = (tonumber(sheet.INI_Grad) or 0) +
                          (tonumber(sheet.AGI) or 0) +
                          (tonumber(sheet.INI_Out) or 0)

    sheet.APA_Total = (tonumber(sheet.APA_Grad) or 0) +
                          (tonumber(sheet.LUT) or 0) +
                          (tonumber(sheet.APA_Out) or 0)

    sheet.FORT_Total = (tonumber(sheet.FORT_Grad) or 0) +
                           (tonumber(sheet.VIG) or 0) +
                           (tonumber(sheet.FORT_Out) or 0)

    sheet.REF_Total = (tonumber(sheet.REF_Grad) or 0) +
                          (tonumber(sheet.AGI) or 0) +
                          (tonumber(sheet.REF_Out) or 0)

    sheet.RES_Total = (tonumber(sheet.RES_Grad) or 0) +
                          (tonumber(sheet.VIG) or 0) +
                          (tonumber(sheet.RES_Out) or 0)

    sheet.VON_Total = (tonumber(sheet.VON_Grad) or 0) +
                          (tonumber(sheet.SAB) or 0) +
                          (tonumber(sheet.VON_Out) or 0)

    sheet.ANTE_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                                (tonumber(sheet.SAB) or 0) +
                                (tonumber(sheet.ANTE_QUAD_OUT) or 0)

    sheet.APAN_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                                (tonumber(sheet.DES) or 0) +
                                (tonumber(sheet.APAN_QUAD_OUT) or 0)

    sheet.ATRA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                                (tonumber(sheet.INTE) or 0) +
                                (tonumber(sheet.ATRA_QUAD_OUT) or 0)

    sheet.DRI_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                               (tonumber(sheet.AGI) or 0) +
                               (tonumber(sheet.DRI_QUAD_OUT) or 0)

    sheet.GOL_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                               (tonumber(sheet.FOR) or 0) +
                               (tonumber(sheet.GOL_QUAD_OUT) or 0)

    sheet.FALTA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                                 (tonumber(sheet.PRE) or 0) +
                                 (tonumber(sheet.FALTA_QUAD_OUT) or 0)

    sheet.PASS_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                                (tonumber(sheet.FOR) or 0) +
                                (tonumber(sheet.PASS_QUAD_OUT) or 0)

    sheet.REBA_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                                (tonumber(sheet.FOR) or 0) +
                                (tonumber(sheet.REBA_QUAD_OUT) or 0)

    sheet.ROU_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                               (tonumber(sheet.LUT) or 0) +
                               (tonumber(sheet.ROU_QUAD_OUT) or 0)

    sheet.VEL_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                               (tonumber(sheet.AGI) or 0) +
                               (tonumber(sheet.VEL_QUAD_OUT) or 0)

    sheet.DEFE_QUAD_TOTAL = (tonumber(sheet.VEI_Grad) or 0) +
                                (tonumber(sheet.AGI) or 0) +
                                (tonumber(sheet.DEFE_QUAD_OUT) or 0)

    sheet.GOL_MOD = cadaDez(sheet.GOL_QUAD_TOTAL + 10) .. "q"
    sheet.PAS_MOD = cadaDez(sheet.PASS_QUAD_TOTAL + 10) .. "q"
    sheet.REB_MOD = cadaDez(sheet.REBA_QUAD_TOTAL + 10) .. "q"
    sheet.VEL_MOD = cadaDez(sheet.VEL_QUAD_TOTAL + 10) .. "q"

    local corpo = tonumber(sheet.ACR_Grad or 0) + tonumber(sheet.ATL_Grad or 0) +
                      tonumber(sheet.VEI_Grad or 0) +
                      tonumber(sheet.FUR_Grad or 0) +
                      tonumber(sheet.PRE_Grad or 0)

    local mente = tonumber(sheet.ENG_Grad or 0) +
                      tonumber(sheet.INTU_Grad or 0) +
                      tonumber(sheet.INV_Grad or 0) +
                      tonumber(sheet.PERC_Grad or 0) +
                      tonumber(sheet.PERS_Grad or 0) +
                      tonumber(sheet.TRA_Grad or 0) +
                      tonumber(sheet.INT_Grad or 0) +
                      tonumber(sheet.CON_Grad or 0)

    local conhecimentos = tonumber(sheet.ATU_Grad or 0) +
                              tonumber(sheet.C_ADI_Grad or 0) +
                              tonumber(sheet.C_AZA_Grad or 0) +
                              tonumber(sheet.C_CON_Grad or 0) +
                              tonumber(sheet.C_CRI_Grad or 0) +
                              tonumber(sheet.C_ENC_Grad or 0) +
                              tonumber(sheet.C_FEI_Grad or 0) +
                              tonumber(sheet.C_HER_Grad or 0) +
                              tonumber(sheet.C_MAL_Grad or 0) +
                              tonumber(sheet.C_POC_Grad or 0) +
                              tonumber(sheet.C_RUN_Grad or 0) +
                              tonumber(sheet.C_TRA_Grad or 0)

    local feiticosCadastrados = NDB.getChildNodes(sheet.magias)
    local totalFeiticos = 0

    for x = 1, #feiticosCadastrados, 1 do
        totalFeiticos =
            totalFeiticos + tonumber(feiticosCadastrados[x].Grad or 0)
    end

    local atributos = tonumber(sheet.AGI or 0) + tonumber(sheet.DES or 0) +
                          tonumber(sheet.FOR or 0) + tonumber(sheet.LUT or 0) +
                          tonumber(sheet.VIG or 0) + tonumber(sheet.INTE or 0) +
                          tonumber(sheet.PRE or 0) + tonumber(sheet.SAB or 0)

    local defesas = tonumber(sheet.INI_Grad or 0) + tonumber(sheet.APA_Grad or 0) +
                        tonumber(sheet.FORT_Grad or 0) +
                        tonumber(sheet.REF_Grad or 0) +
                        tonumber(sheet.RES_Grad or 0) +
                        tonumber(sheet.VON_Grad or 0)

    sheet.pontosDefesas = "Defesas - " .. defesas
    sheet.pontosAtributos = "Atributos - " .. atributos * 2
    sheet.pontosPericias =
        "Pericias - " .. ((corpo + mente + conhecimentos) / 2)
    sheet.pontosFeiticos = "Feiticos - " .. totalFeiticos
end

function harryScript.onNodeReady(sheet)
    if sheet == nil then return end

    local campos = {
        "DES", "adivinhacao", "azaracao", "contraFeitico", "encantamento",
        "feitico", "transmutacao", "arteDasTrevas", "fisico", "mental",
        "concentracao", "acerto", "ferimentos"
    }

    for x = 1, #campos, 1 do
        if sheet[campos[x]] == nil then sheet[campos[x]] = 0 end
    end
end

return harryScript
