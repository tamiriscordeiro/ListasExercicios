// 3 – Elaborar um programa que popule um array de 30 posições com valores de 1 até 30. No final,
// exibir o conteúdo do array.

#INCLUDE 'TOTVS.CH'

User Function Ex3L5()
    Local aA        := {}
    Local cMostra   := ''
    Local nCont     := 0

    For nCont := 1 to 30
        aAdd(aA, Randomize(1, 30))
    Next

        For nCont := 1 to 30 
        If nCont < 30
            cMostra += cValToChar(aA[nCont]) + ', '
        Else 
            cMostra += cValToChar(aA[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conteúdo do Array')
Return
