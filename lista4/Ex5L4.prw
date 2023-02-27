// 5 – Escreva um programa que pergunte a quantidade de Km percorridos por um carro
// alugado e a quantidade de dias pelos quais ele foi alugado. 
// Calcule o preço a pagar, sabendo que o carro custa R$60,00/dia e R$0,15/Km rodado.

#INCLUDE 'TOTVS.CH'

User Function Ex5L4()
    local oDlg  := NIL 
    local cTitle    := 'Aluguel Veículo' 
    local cAsk1     := 'KM Percorridos: ' 
    local cAsk2     := 'Dias Alugado: ' 
    local cKM       := Space(10) 
    local cDias     := Space(10)
    local nKM       := 0
    local nDias     := 0 
    local nOpcao    := 0

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 080, 300 PIXEL 
    @ 014, 010 SAY cAsk1 SIZE 55, 07 OF oDlg PIXEL 
    @ 024, 010 SAY cAsk2 SIZE 55, 07 OF oDlg PIXEL 
    @ 014, 075 MSGET cKM SIZE 30, 07 OF oDlg PIXEL 
    @ 024, 075 MSGET cDias SIZE 30, 07 OF oDlg PIXEL 
    DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg 
    DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg 

    ACTIVATE MSDIALOG oDlg CENTERED   

    if nOpcao == 1
        nKM := val(cKM)
        nDias := val(cDias)

        Aluguel(nKM , nDias)
    else
        FwAlertError('Cancelado pelo Usuário' , 'Cancelado!')
    endif 
Return 

Static Function Aluguel(nKM , nDias)
    local nTotKM    := 0
    local nTotDias  := 0
    local nTotal    := 0

    nTotKM := nKM * 0.15
    nTotDias := nDias * 60
    nTotal  := nTotKM + nTotDias

    FwAlertSuccess(' O valor do aluguel do carro é R$ ' + Alltrim(str(nTotal , 20 , 2)) + ' reais', 'Aluguel Veículo ')

Return
