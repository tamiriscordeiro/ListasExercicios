// 2 – Desenvolva um programa que converta Dólar (US$) para Real (R$). 
// O programa deverá solicitar ao usuário o valor do Dólar e a quantidade de dólares que deseja converter. 
// No final, apresentar o valor total convertido para reais.

#INCLUDE 'TOTVS.CH'

User Function Ex2L4()
    local oDlg  := NIL 
    local cTitle    := 'Conversão Dolar/Real' 
    local cAsk1     := 'Valor do Dólar Atual: ' 
    local cAsk2     := 'Valor em Dólares: ' 
    local cCot      := Space(10) 
    local cValD     := Space(10)
    local nCot      := 0
    local nValD     := 0 
    local nOpcao    := 0

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 080, 300 PIXEL 
    @ 014, 010 SAY cAsk1 SIZE 55, 07 OF oDlg PIXEL 
    @ 024, 010 SAY cAsk2 SIZE 55, 07 OF oDlg PIXEL 
    @ 014, 075 MSGET cCot SIZE 30, 07 OF oDlg PIXEL 
    @ 024, 075 MSGET cValD SIZE 30, 07 OF oDlg PIXEL 
    DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg 
    DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg 

    ACTIVATE MSDIALOG oDlg CENTERED   

    if nOpcao == 1
        nCot := val(cCot)
        nValD := val(cValD)

        Cotacao(nCot , nValD)
    else
        FwAlertError('Cancelado pelo Usuário' , 'Cancelado!')
    endif 
Return 

Static Function Cotacao(nCot , nValD)
    local nTotal := 0

    nTotal := nCot * nValD

    FwAlertSuccess(' O valor que possui em dólares equivale a R$ ' + Alltrim(str(nTotal , 20 , 2)) + ' reais', 'Dólares em Reais ')

Return
