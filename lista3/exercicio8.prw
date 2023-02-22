// 8 � Desenvolva um programa que retorne o produto de maior valor total dos pedidos de venda (SC6).
// O c�digo, descri��o, valor unit�rio e valor total devem ser apresentados.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function SELTOP1()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := "SELECT TOP 1 " + CRLF
    cQuery += "     C6_DESCRI " + CRLF
    cQuery += "     ,C6_PRODUTO " + CRLF
    cQuery += "     ,C6_PRCVEN " + CRLF
    cQuery += "     ,C6_VALOR " + CRLF
    cQuery += "FROM " + RetSqlName('SC6') +  CRLF
    cQuery += " ORDER BY C6_VALOR DESC "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        cMsg += 'C�digo: ' + &(cAlias)->(C6_PRODUTO) + CRLF
        cMsg += 'Descri��o: ' + &(cAlias)->(C6_DESCRI) + CRLF
        cMsg += 'Pre�o de venda: R$' + Alltrim(STR(&(cAlias)->(C6_PRCVEN))) + CRLF
        cMsg += 'Valor total: R$' + Alltrim(STR(&(cAlias)->(C6_VALOR))) + CRLF
        cMsg += '--------------------' + CRLF + CRLF
        
        &(cAlias)->(DbSkip())
    Enddo

    FwAlertSuccess(cMsg, 'Produto de maior valor total')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
