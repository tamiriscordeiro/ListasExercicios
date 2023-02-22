// 9 – Desenvolva uma rotina em que, com base em um código de produto informado pelo usuário,
// retorne todos os pedidos de venda em que esse produto está sendo usado.
// Obs: Os números dos pedidos devem estar separados por vírgula.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function AchaPed()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    lOCAL cCod    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     C6_NUM " + CRLF
    cQuery += "     ,C6_PRODUTO " + CRLF
    cQuery += "FROM " + RetSqlName('SC6') +  CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := FwInputBox('Digite o código do produto.', cCod)

    While &(cAlias)->(!EOF())

       If cCod == ALLTRIM(&(cAlias)->(C6_PRODUTO))
       
            cMsg += &(cAlias)->(C6_NUM) + ', '

        Endif

        &(cAlias)->(DbSkip())
    Enddo

        FwAlertInfo(cMsg, 'Pedidos de compra do produto', cCod)

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
