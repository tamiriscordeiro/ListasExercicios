// 3 - Escreva um algoritmo para ler o sal�rio mensal atual de um funcion�rio e o percentual de reajuste. 
// Calcular e escrever o valor do novo sal�rio.

#INCLUDE 'TOTVS.CH'

User Function Ex3L4()
    local oDlg  := NIL 
    local cTitle    := 'Reajuste Salarial' 
    local cAsk1     := 'Digite o valor do sal�rio: ' 
    local cAsk2     := 'Digite o valor do reajuste (porcentagem): ' 
    local cSal      := Space(10) 
    local cReaj     := Space(10)
    local nSal      := 0
    local nReaj     := 0 
    local nOpcao    := 0

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 080, 300 PIXEL 
    @ 014, 010 SAY cAsk1 SIZE 70, 07 OF oDlg PIXEL 
    @ 024, 010 SAY cAsk2 SIZE 70, 07 OF oDlg PIXEL 
    @ 014, 80 MSGET cSal SIZE 30, 07 OF oDlg PIXEL 
    @ 024, 80 MSGET cReaj SIZE 30, 07 OF oDlg PIXEL 
    DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg 
    DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg 

    ACTIVATE MSDIALOG oDlg CENTERED   

    if nOpcao == 1
        nSal := val(cSal)
        nReaj := val(cReaj)

        CalcReaj(nSal , nReaj)
    else
        FwAlertError('Cancelado pelo Usu�rio' , 'Cancelado!')
    endif 
Return 

Static Function CalcReaj(nSal , nReaj)
    local nTotal := 0
    local nPorc  := 0

    nPorc := (nSal/100) * nReaj
    nTotal := nSal + nPorc

    FwAlertSuccess(' O valor do sal�rio com reajuste � R$ ' + Alltrim(str(nTotal , 20 , 2)) + ' reais', 'Novo Sal�rio ')

Return
