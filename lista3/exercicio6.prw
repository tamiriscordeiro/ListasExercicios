// 6 � Fa�a um programa em que o usu�rio possa
// digitar um c�digo de produto e saber se esse
// c�digo existe no sistema ou n�o. Caso exista,
// apresente o C�digo, Descri��o e o Pre�o de Venda,
// caso contr�rio, apresente uma mensagem
// informando que n�o existe.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function CHECACOD()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    Local cCod    := ''
    Local nI      := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     B1_COD " + CRLF
    cQuery += "     ,B1_DESC " + CRLF
    cQuery += "     ,B1_PRV1 " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') +  CRLF
    cQuery += " ORDER BY B1_DESC ASC "

    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := FwInputBox('Insira aqui o c�digo do produto.', cCod)

    While &(cAlias)->(!EOF())

        If cCod == ALLTRIM(&(cAlias)->(B1_COD))
            cMsg += 'C�digo: ' + &(cAlias)->(B1_COD) + CRLF
            cMsg += 'Descri��o: ' + &(cAlias)->(B1_DESC) + CRLF
            cMsg += 'Pre�o de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF
            cMsg += '--------------------' + CRLF + CRLF

            nI++
        Endif

        &(cAlias)->(DbSkip())
    Enddo

    If nI > 0
        FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
        FwAlertError('C�digo de produto inexistente no sistema')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
