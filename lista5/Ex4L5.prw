// 4 � Elaborar um programa que popule um array de 10 posi��es com valores pares a partir de 2 at� o 20.
// No final, exibir o conte�do do array.

#INCLUDE 'TOTVS.CH'

User Function Ex4L5()
    Local aA        := {}
    Local nCont     := 0
    Local cMostra   := ''

    For nCont := 2 to 20 step 2
        aAdd(aA, nCont)
    Next

    For nCont := 1 to 10 
        If nCont < 10
            cMostra += cValToChar(aA[nCont]) + ', '
        Else 
            cMostra += cValToChar(aA[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Array Par')
Return
