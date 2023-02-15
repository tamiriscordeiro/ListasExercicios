#INCLUDE "TOTVS.CH"

// - Ler um vetor aArray1 de 10 n�meros. Ap�s, ler mais um n�mero e guardar em uma vari�vel nNum.
// Armazenar em um array aArray2 o resultado de cada elemento de aArray1 multiplicado pelo valor nNum. 
// Logo ap�s, imprimir o vetor aArray2.

User Function MultVetor()

    Local nRecebe := 0
    local aArray1 := {}
    local aArray2 := {}
    local nNum    := 0
    Local cMostra := ''
    Local nI      := 0

    for nI := 1 to 10
        nRecebe := Val(FwInputBox("Digite o " + AllTrim(Str(nI)) + "� n�mero do vetor"))
        AADD(aArray1, nRecebe)
    next

    nNum := Val(FwInputBox("Digite um n�mero para multiplicar pelo vetor"))

    for nI := 1 to 10
        AADD(aArray2,aArray1[nI] * nNum)
        
    next

    for nI := 1 to 10
        If nI < 10
            cMostra += (Alltrim(STR(aArray2[nI])) + ',')
        Else
            cMostra += (Alltrim(STR(aArray2[nI])) + '.')
        Endif
    next

    FwAlertSuccess("Vetor resultado: " + cMostra)
return
