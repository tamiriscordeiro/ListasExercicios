// 8 – Desenvolva um programa que calcule o IMC (Índice de Massa Corporal) de um indivíduo.

#INCLUDE 'TOTVS.CH'

User Function L04Ex08()
    Local nPeso  := SPACE(6)
    Local nAltura  := SPACE(3)
    Local nOpcao := 0
    Local cTitle := 'Cálculos' // Título
    Local nJanLarg := 250
    Local nJanAltu := 200
    Local oGrpLog 
    Private oDlg   := NIL // Variável objeto que recebe os componentes da caixa de diálogo


    //Cria uma caixa de diálogo no padrão Windows com o título da variável cTítulo que começa no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

        @ 003, 001     GROUP oGrpLog TO (nJanAltu/2)-1, (nJanLarg/2)-3         PROMPT "IMC:  "     OF oDlg PIXEL

            //Item que ficará dentro da janela de diálogo ('OF' define o componente pai)
            @ 030, 010  SAY 'Peso Kg'   SIZE 55, 07 OF oDlg PIXEL
            @ 030, 040  MSGET nPeso      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET irá abrir uma área de input que salvará a informação dentro de uma variável.
            @ 050, 010  SAY 'Altura cm'   SIZE 55, 07 OF oDlg PIXEL
            @ 050, 040  MSGET nAltura      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

        DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
        DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de diálogo oDlg centralizada     

    if nOpcao == 1
        IMC(Val(nPeso), Val(nAltura))
    Else
        FwAlertError('CANCELADO PELO USUÁRIO', 'CANCELADO')
    endif
Return

Static Function IMC(nPeso, nAltura)
    Local nIMC := 0

    nIMC := nPeso / ((nAltura/100)**2)

    If nIMC < 18.5
        FwAlertSuccess('IMC: ' + cValtoChar(nIMC) + CRLF +  ' Magreza - Obesidade (Grau): 0')
    Elseif nIMC <= 24.9
        FwAlertSuccess('IMC: ' + cValtoChar(nIMC) + CRLF +  ' Normal - Obesidade (Grau): 0')
    Elseif nIMC <= 29.9
        FwAlertSuccess('IMC: ' + cValtoChar(nIMC) + CRLF +  ' Sobrepeso - Obesidade (Grau): I')
    Elseif nIMC <= 39.9
        FwAlertSuccess('IMC: ' + cValtoChar(nIMC) + CRLF +  ' Obesidade - Obesidade (Grau): II')
    Else 
        FwAlertSuccess('IMC: ' + cValtoChar(nIMC) + CRLF +  ' Obesidade Grave - Obesidade (Grau): III')
    Endif
Return
