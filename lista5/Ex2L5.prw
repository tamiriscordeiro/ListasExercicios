#INCLUDE "TOTVS.CH"

User Function Ex2L5()
    Local aA        := {}
    Local nCont     := 1
    Local cMostra   := ''

    For nCont := 1 to 10
        aAdd(aA, FwInputBox('Insira aqui o ' + cValToChar(nCont) + 'º número'))
    Next

    For nCont := 10 to 1 step -1
        If nCont > 1
            cMostra += aA[nCont] + ', '
        Else 
            cMostra += aA[nCont] + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Ordem Inversa')
Return
