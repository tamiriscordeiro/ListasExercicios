// 12 � Fa�a um programa em que o usu�rio possa
// digitar um per�odo (data in�cio / data fim) e saber
// quais s�o os pedidos de compra existentes no
// per�odo informado.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Ex12L4()
    Local nOpcao   := 0
    Local cTitle   := 'C�lculos' // T�tulo
    Local cTexto   := 'Calculando'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Vari�vel objeto que recebe os componentes da caixa de di�logo
    Private dData1 := SPACE(10)
    Private dData2 := SPACE(10)

    //Cria uma caixa de di�logo no padr�o Windows com o t�tulo da vari�vel cT�tulo que come�a no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficar� dentro da janela de di�logo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto           SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'Data inicial'   SIZE 55, 07 OF oDlg PIXEL
    @ 030, 040  MSGET dData1         SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET ir� abrir uma �rea de input que salvar� a informa��o dentro de uma vari�vel.
    @ 050, 010  SAY 'Data final'     SIZE 55, 07 OF oDlg PIXEL
    @ 050, 040  MSGET dData2         SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de di�logo oDlg centralizada     

    if nOpcao == 1
        RelatoData()
    Else
        FwAlertError('CANCELADO PELO USU�RIO', 'CANCELADO')
    endif
Return

Static Function RelatoData()
    Local aArea     := GetArea()
    Local cAlias    := GetNextAlias()
    Local cQuery    := ""
    Local cMsg      := ""
    Local nCont     := 0
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

    dData1 := ctod(dData1)
    dData2 := ctod(dData2)

    cQuery := "SELECT * FROM " + RetSqlName('SC5') + " WHERE C5_EMISSAO >= '" + DTOS(dData1) + "' AND C5_EMISSAO <= '" + DTOS(dData2) + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
        cMsg += "Pedido: " + &(cAlias)->(C5_NUM) + " Data de Emiss�o: " + cvaltochar(StoD(&(cAlias)->(C5_EMISSAO))) + CRLF + CRLF

            If nCont == 6
                FwAlertInfo(cMsg, 'Pedidos')
                nCont := 0
                cMsg := ''
            Endif'

        nCont++
        &(cAlias)->(DbSkip())
    End

    If nCont > 0 
        FwAlertInfo(cMsg, 'Pedidos')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return
