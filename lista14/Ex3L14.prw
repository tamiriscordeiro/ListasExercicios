#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function Ex3L14
    executa uma rotina automática para excluir um Fornecedor.
    Obs: Se houver algum problema no processo, 
    deve ser apresentada uma mensagem que indica onde está o problema.
    @type  Function
    @author Tamíris Cordeiro
    @since 05/05/2023
    /*/
User Function Ex3L14()
    local aDados    := {}
    local nOper     := 5  

    private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    aAdd(aDados, {'A2_COD'      , 'UNIAO'          , NIL}) 
    aAdd(aDados, {'A2_NOME'     , 'DELETADO'       , NIL})

    MsExecAuto({|x, y| MATA020(x, y)}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif
Return
