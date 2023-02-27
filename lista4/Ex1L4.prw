// 1 – Ler dois números positivos e apresentar a soma, diferença, produto e quociente entre eles.

#INCLUDE 'TOTVS.CH'

User Function Ex1L4()
    local oDlg  := NIL 
    local cTitle    := 'Vamos calcular!' 
    local cAsk1     := 'Primeiro valor: ' 
    local cAsk2     := 'Segundo valor: ' 
    local cNum1     := Space(3) 
    local cNum2     := Space(3)
    local nNum1     := 0
    local nNum2     := 0 
    local nOpcao    := 0

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 080, 300 PIXEL 
    @ 014, 010 SAY cAsk1 SIZE 55, 07 OF oDlg PIXEL 
    @ 024, 010 SAY cAsk2 SIZE 55, 07 OF oDlg PIXEL 
    @ 014, 050 MSGET cNum1 SIZE 20, 07 OF oDlg PIXEL PICTURE '@R 999'
    @ 024, 050 MSGET cNum2 SIZE 20, 07 OF oDlg PIXEL PICTURE '@R 999'
    DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg 
    DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg 

    ACTIVATE MSDIALOG oDlg CENTERED   

    if nOpcao == 1
        nNum1 := val(cNum1)
        nNum2 := val(cNum2)

        Operacoes(nNum1 , nNum2)
    else
        FwAlertError('Cancelado pelo Usuário' , 'Cancelado!')
    endif 
Return 

Static Function Operacoes(nNum1 , nNum2)
    local nSoma := 0
    local nDiv  := 0
    local nMult := 0
    local nDif  := 0


    nSoma := nNum1 + nNum2
    
    nDiv := nNum1 / nNum2

    nMult := nNum1 * nNum2

    nDif := nNum1 - nNum2

    FwAlertSuccess(cValToChar(str(nNum1)) + ' + ' + cValToChar(str(nNum2)) + ' = ' + cValToChar(str(nSoma)) + CRLF + ;
    cValToChar(str(nNum1)) + ' / ' + cValToChar(str(nNum2)) + ' = ' + cValToChar(str(nDiv)) + CRLF + ;
    cValToChar(str(nNum1)) + ' * ' + cValToChar(str(nNum2)) + ' = ' + cValToChar(str(nMult)) + CRLF + ;
    cValToChar(str(nNum1)) + ' - ' + cValToChar(str(nNum2)) + ' = ' + cValToChar(str(nDif)) , 'Operações Matemáticas: ')

Return
