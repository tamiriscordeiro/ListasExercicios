// 15 – Ler 12 elementos de um array e colocá-los em ordem crescente.
// Obs: NÃO é permitido o uso da função ASORT().

#INCLUDE 'TOTVS.CH'

User Function L05Ex15()
    Local aArray := {}
    Local nI := 0
    Local nCont := 0
    Local nCont1  := 0
    Local nAux := 0
    Local cMostra := ''

    For nCont1 := 1 to 12
        AADD(aArray, RANDOMIZE(1, 99))
    Next

    For nCont := 1 to len(aArray)
        For nI := 1 to len(aArray)
            if aArray[nI] > aArray[nCont]
                nAux := aArray[nCont]
                aArray[nCont] := aArray[nI]
                aArray[nI] := nAux
            endif
        Next
    Next

    For nCont := 1 to Len(aArray)
        If nCont < 12
            cMostra += cValToChar(aArray[nCont]) + ', '
        Else 
            cMostra += cValToChar(aArray[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Array')

Return
