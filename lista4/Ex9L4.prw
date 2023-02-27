//9 – Desenvolva um programa para calcular a TMB (Taxa Metabólica Basal) de um indivíduo. 
// A fórmula para calcular a TMB de homens, é diferente da fórmula para mulheres. As fórmulas são:
// o Para Homens:
// TMB = 66.5 + (13.75 * peso) + (5.003 * altura em cm) – (6.75 * idade)
// o Para Mulheres:
// TMB = 655.1 + (9.563 * peso) + (1.850 * altura em cm) – (4.676 * idade)

#INCLUDE 'TOTVS.CH'

User Function Ex9L4()
    local oDlg  := NIL 
    local cTitle    := 'Taxa Metabólica Basal (TMB)' 
    local cAsk1     := 'Sexo (F ou M): ' 
    local cAsk2     := 'Peso: '
    local cAsk3     := 'Altura (em cm): '
    local cAsk4     := 'Idade: ' 
    local cSex      := Space(1) 
    local cPeso     := Space(10)
    local cAlt      := Space(10)
    local cIdade    := Space(10)
    local nPeso     := 0
    local nAlt      := 0 
    local nIdade    := 0
    local nOpcao    := 0

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 150, 300 PIXEL 
    @ 014, 010 SAY cAsk1 SIZE 55, 07 OF oDlg PIXEL 
    @ 024, 010 SAY cAsk2 SIZE 55, 07 OF oDlg PIXEL 
    @ 034, 010 SAY cAsk3 SIZE 55, 07 OF oDlg PIXEL
    @ 044, 010 SAY cAsk4 SIZE 55, 07 OF oDlg PIXEL
    @ 014, 075 MSGET cSex SIZE 30, 07 OF oDlg PIXEL 
    @ 024, 075 MSGET cPeso SIZE 30, 07 OF oDlg PIXEL 
    @ 034, 075 MSGET cAlt SIZE 30, 07 OF oDlg PIXEL
    @ 044, 075 MSGET cIdade SIZE 30, 07 OF oDlg PIXEL

    DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg 
    DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg 

    ACTIVATE MSDIALOG oDlg CENTERED   

    if nOpcao == 1
        cSex    := UPPER(cSex)
        nPeso   := val(cPeso)
        nAlt    := val(cAlt)
        nIdade  := val(cIdade)

        TMB(cSex, nPeso , nAlt , nIdade)
    else
        FwAlertError('Cancelado pelo Usuário' , 'Cancelado!')
    endif 
Return 

Static Function TMB(cSex, nPeso , nAlt, nIdade)
    local nTaxa := 0

    if cSex == 'F'
        nTaxa := 655.1 + (9.563 * nPeso) + (1.850 * nAlt) - (4.676 * nIdade)
        FwAlertSuccess('Sua taxa metabólica basal (TBM) é: ' + Alltrim(str(nTaxa , 20 , 2)) , 'TBM ')
    elseif cSex == 'M'
        nTaxa := 66.5 + (13.75 * nPeso) + (5.003 * nAlt) - (6.75 * nIdade)
        FwAlertSuccess('Sua taxa metabólica basal (TBM) é: ' + Alltrim(str(nTaxa , 20 , 2)) , 'TBM ')
    else
        FwAlertError('Dados Inválidos!')
    endif

Return
