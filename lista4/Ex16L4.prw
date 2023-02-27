// 16 � Crie uma rotina que retorne todos os
// clientes situados em um estado/uf selecionado
// pelo usu�rio.


#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Ex16L4()
    Local nOpcao   := 0
    Local cTitle   := 'Fornecedores' // T�tulo
    Local cTexto   := 'Estado'
    Local nJanLarg := 150
    Local nJanAltu := 150
    Local oGrpLog
    Private oDlg   := NIL // Vari�vel objeto que recebe os componentes da caixa de di�logo
    Private cEstado := SPACE(2)


    //Cria uma caixa de di�logo no padr�o Windows com o t�tulo da vari�vel cT�tulo que come�a no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    @ 003, 001     GROUP oGrpLog TO (nJanAltu/2)-1, (nJanLarg/2)-3         PROMPT cTexto     OF oDlg PIXEL

        //Item que ficar� dentro da janela de di�logo ('OF' define o componente pai)
        @ 020, 010  SAY 'Estado do Fornecedor'   SIZE 55, 07 OF oDlg PIXEL
        @ 030, 010  MSGET cEstado                SIZE 55, 07 OF oDlg PIXEL PICTURE '@9'//MSGET ir� abrir uma �rea de input que salvar� a informa��o dentro de uma vari�vel.


    DEFINE SBUTTON FROM 060, 010 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 060, 040 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de di�logo oDlg centralizada     

    if nOpcao == 1
        PegaEstado()
    Else
        FwAlertError('CANCELADO PELO USU�RIO', 'CANCELADO')
    endif
Return

Static Function PegaEstado()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    Local nCont   := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     A2_COD " + CRLF
    cQuery += "     ,A2_NOME " + CRLF
    cQuery += "FROM " + RetSqlName('SA2') +  CRLF
    cQuery += "WHERE " + CRLF
    cQuery += "     A2_EST = '" + Upper(cEstado) + "'"

    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        cMsg += 'C�digo Fornecedor: ' + &(cAlias)->(A2_COD) + CRLF
        cMsg += 'Nome Fornecedor: ' + &(cAlias)->(A2_NOME) + CRLF
        cMsg += '--------------------' + CRLF + CRLF

        nCont++

        If nCont == 10
            FwAlertInfo(cMsg, 'Fornecedores Situados em SP')
            nCont := 0
            cMsg := ''
        Endif

        &(cAlias)->(DbSkip())
    Enddo

    If nCont > 0 
        FwAlertInfo(cMsg, 'Fornecedores Situados em ' + cEstado)
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
