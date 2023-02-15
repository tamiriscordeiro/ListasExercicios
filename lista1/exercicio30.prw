#INCLUDE "TOTVS.CH"

// - Faça um algoritmo para ler 10 números e armazenar em um array. Após a leitura total dos 10
// números, o algoritmo deve escrever esses 10 números lidos na ordem inversa.

User Function InverteVet()
    Local nNumero := 0
    Local nI      := 0
    Local cMostra := ''
    Local aArray1 := {}

    For nI := 1 to 10
        nNumero := Val(FwInputBox('Digite aqui o ' + AllTrim(STR(nI)) + 'º número do vetor.'))
        AADD(aArray1, nNumero)
    Next

    For nI := 10 to 1 Step -1
        If nI != 1
            cMostra += (Alltrim(STR(aArray1[nI])) + ',')
        Else
            cMostra += (Alltrim(STR(aArray1[nI])) + '.')
        Endif
    Next

    FwAlertSuccess('Vetor resultante com os números na ordem inversa é: ' + cMostra)
return
