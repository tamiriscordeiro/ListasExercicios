// 4 � Fa�a um programa que leia a largura e a altura de uma parede em metros, calcule sua �rea e a
// quantidade de tinta necess�ria para pint�-la, sabendo que cada litro de tinta pinta uma �ria de 2
// metros quadrados

#INCLUDE 'TOTVS.CH'

User Function Ex4L4()
    Local nAlt   := SPACE(9)
    Local nLarg  := SPACE(9)
    Local nOpcao := 0
    Local cTitle := '�rea' // T�tulo
    Local cTexto := 'Informa��es da Parede'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Vari�vel objeto que recebe os componentes da caixa de di�logo


    //Cria uma caixa de di�logo no padr�o Windows com o t�tulo da vari�vel cT�tulo que come�a no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficar� dentro da janela de di�logo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto      SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'Altura'    SIZE 55, 07 OF oDlg PIXEL
    @ 030, 040  MSGET nAlt      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET ir� abrir uma �rea de input que salvar� a informa��o dentro de uma vari�vel.
    @ 050, 010  SAY 'Largura'   SIZE 55, 07 OF oDlg PIXEL
    @ 050, 040  MSGET nLarg     SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de di�logo oDlg centralizada     

    if nOpcao == 1
        Area(Val(nAlt), Val(nLarg))
    Else
        FwAlertError('CANCELADO PELO USU�RIO', 'CANCELADO')
    endif
Return

Static Function Area(nAlt, nLarg)
    Local nArea := 0
    
    nArea := nAlt * nLarg

    FwAlertSuccess('A �rea da parede � de: ' + cValToChar(nArea) + 'm�' + CRLF;
    + 'E ser�o necess�rios: ' + cValToChar(nArea/2) + ' litros de tinta para pint�-la', 'Calculado')
Return
