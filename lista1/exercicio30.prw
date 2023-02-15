#INCLUDE "TOTVS.CH"

// - Fa�a um algoritmo para ler 10 n�meros e armazenar em um array. Ap�s a leitura total dos 10
// n�meros, o algoritmo deve escrever esses 10 n�meros lidos na ordem inversa.

User Function InverteVet()
    Local nNumero := 0
    Local nI      := 0
    Local cMostra := ''
    Local aArray1 := {}

    For nI := 1 to 10
        nNumero := Val(FwInputBox('Digite aqui o ' + AllTrim(STR(nI)) + '� n�mero do vetor.'))
        AADD(aArray1, nNumero)
    Next

    For nI := 10 to 1 Step -1
        If nI != 1
            cMostra += (Alltrim(STR(aArray1[nI])) + ',')
        Else
            cMostra += (Alltrim(STR(aArray1[nI])) + '.')
        Endif
    Next

    FwAlertSuccess('Vetor resultante com os n�meros na ordem inversa �: ' + cMostra)
return
