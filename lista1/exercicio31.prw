#INCLUDE "TOTVS.CH"

// - Fa�a um algoritmo para ler 10 n�meros e armazenar em um array. Ap�s isto, o algoritmo deve
// ordenar os n�meros no array em ordem crescente. Escrever o vetor ordenado.

User Function VetCrescente()
    Local nNumero := 0
    Local nI      := 0
    Local cMostra := ''
    Local aArray1 := {}

    For nI := 1 to 10
        nNumero := Val(FwInputBox('Digite aqui o ' + AllTrim(STR(nI)) + '� n�mero do vetor.'))
        AADD(aArray1, nNumero)
    Next

    ASORT(aArray1)

    For nI := 1 to 10
        If nI < 10
            cMostra += (Alltrim(STR(aArray1[nI])) + ',')
        Else
            cMostra += (Alltrim(STR(aArray1[nI])) + '.')
        Endif
    Next

    FwAlertSuccess('Vetor resultante com os n�meros na ordem crescente �: ' + cMostra)
return
