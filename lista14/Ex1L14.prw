#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function Ex1L14
    Programa que executa uma rotina automática para cadastrar um cliente.
    @type  Function
    @author Tamíris Cordeiro
    @since 05/05/2023
    /*/
User Function Ex1L14()
    local aDados    := {}
    local nOper     := 3  

    private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    aAdd(aDados, {'A1_FILIAL'   , xFilial('SA1')    , NIL})  
    aAdd(aDados, {'A1_COD'      , 'CL0002'          , NIL})  
    aAdd(aDados, {'A1_LOJA'     , '01'              , NIL})  
    aAdd(aDados, {'A1_NOME'     , 'OUTRO CLIENTE'   , NIL})  
    aAdd(aDados, {'A1_NREDUZ'   , 'CLIENTE2'        , NIL})  
    aAdd(aDados, {'A1_TIPO'     , 'F'               , NIL})  
    aAdd(aDados, {'A1_END'      , 'RUA DO CONSUMO'  , NIL})  
    aAdd(aDados, {'A1_EST'      , 'SP'              , NIL})  
    aAdd(aDados, {'A1_MUN'      , 'ATIBAIA'         , NIL})  

    MsExecAuto({|x, y| CRMA980(x, y)}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif
Return
