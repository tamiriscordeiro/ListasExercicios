// 4 – Faça um programa que leia a largura e a altura de uma parede em metros, calcule sua área e a
// quantidade de tinta necessária para pintá-la, sabendo que cada litro de tinta pinta uma ária de 2
// metros quadrados

#INCLUDE 'TOTVS.CH'

User Function Ex4L4()
    Local nAlt   := SPACE(9)
    Local nLarg  := SPACE(9)
    Local nOpcao := 0
    Local cTitle := 'Área' // Título
    Local cTexto := 'Informações da Parede'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Variável objeto que recebe os componentes da caixa de diálogo


    //Cria uma caixa de diálogo no padrão Windows com o título da variável cTítulo que começa no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficará dentro da janela de diálogo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto      SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'Altura'    SIZE 55, 07 OF oDlg PIXEL
    @ 030, 040  MSGET nAlt      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET irá abrir uma área de input que salvará a informação dentro de uma variável.
    @ 050, 010  SAY 'Largura'   SIZE 55, 07 OF oDlg PIXEL
    @ 050, 040  MSGET nLarg     SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de diálogo oDlg centralizada     

    if nOpcao == 1
        Area(Val(nAlt), Val(nLarg))
    Else
        FwAlertError('CANCELADO PELO USUÁRIO', 'CANCELADO')
    endif
Return

Static Function Area(nAlt, nLarg)
    Local nArea := 0
    
    nArea := nAlt * nLarg

    FwAlertSuccess('A área da parede é de: ' + cValToChar(nArea) + 'm²' + CRLF;
    + 'E serão necessários: ' + cValToChar(nArea/2) + ' litros de tinta para pintá-la', 'Calculado')
Return
