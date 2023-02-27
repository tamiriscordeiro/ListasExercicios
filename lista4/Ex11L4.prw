//11 � Fa�a um programa em que o usu�rio possa digitar um c�digo de produto e saber se esse c�digo existe no sistema ou n�o. 
// Caso exista, apresente o C�digo, Descri��o e o Pre�o de Venda, caso contr�rio, apresente uma mensagem
// informando que n�o existe.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Ex11L4()
    local oDlg  := NIL 
    local cTitle    := 'Produtos' 
    local cAsk1     := 'C�digo: ' 
    local nOpcao    := 0
    private cCod    := Space(6) 

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 080, 300 PIXEL 
    @ 014, 010 SAY cAsk1 SIZE 55, 07 OF oDlg PIXEL 
    @ 014, 050 MSGET cCod SIZE 20, 07 OF oDlg PIXEL 

    DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg 
    DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg 

    ACTIVATE MSDIALOG oDlg CENTERED   

    if nOpcao == 1
        Procura()
    else
        FwAlertError('Cancelado pelo Usu�rio' , 'Cancelado!')
    endif 
Return 

Static Function Procura()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
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
