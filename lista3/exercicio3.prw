// 3 - Faça uma consulta na tabela SC5 que retorne todos os produtos do pedido “PV0008” e
// apresente os seguintes campos em uma mensagem:
// Código – Descrição – Qtd – Vl. Unit – Vl Total

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Venda08()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cProd   := ''
    Local cDesc   := ''
    local nQtd    := 0
    local nPrec   := 0
    local nValor  := 0
    //local cCod    := "PV0008"
    Local cMsg    := ''
    Local nCont   := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     PV.C5_NUM " + CRLF
    cQuery += "     ,PDV.C6_PRODUTO " + CRLF
    cQuery += "     ,PDV.C6_DESCRI " + CRLF
    cQuery += "     ,PDV.C6_QTDVEN " + CRLF
    cQuery += "     ,PDV.C6_PRCVEN  " + CRLF
    cQuery += "     ,PDV.C6_VALOR  " + CRLF
    cQuery += "FROM " + RetSqlName('SC5') + " PV "  + CRLF
    cQuery += "INNER JOIN " + RetSqlName('SC6') + " PDV ON  " + CRLF
    cQuery += "     PV.C5_NUM = PDV.C6_NUM " + CRLF
    cQuery += "WHERE PV.C5_NUM = 'PV0008' " + CRLF
    

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
        cProd := &(cAlias)->(C6_PRODUTO)
        cDesc := &(cAlias)->(C6_DESCRI)
        nQtd := &(cAlias)->(C6_QTDVEN)
        nPrec := &(cAlias)->(C6_PRCVEN)
        nValor := &(cAlias)->(C6_VALOR)


        cMsg += 'Código: ' + cProd + CRLF
        cMsg += 'Descrição: ' + cDesc + CRLF
        cMsg += 'Qtd: ' + cValToChar(nQtd) + CRLF
        cMsg += 'Vl. Unit.: ' + cValToChar(nPrec) + CRLF
        cMsg += 'Vl. Total: ' + cValToChar(nValor) + CRLF
        cMsg += '--------------------' + CRLF + CRLF

        &(cAlias)->(DbSkip())
        nCont++
    Enddo

    FwAlertInfo(cMsg, 'Produtos da venda PV0008.')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
