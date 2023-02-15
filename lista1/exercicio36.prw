#INCLUDE "TOTVS.CH"

//- Faça um programa para calcular n! (Fatorial de n), sendo que o valor inteiro de n é fornecido pelo usuário. 
// Sabe-se que: 4! = 4 * 3 * 2 * 1

User function CalcFatorial()
    Local nNum    := 0
    Local nI      := 0
    Local nResult := 0

    nNum := Val(FwInputBox('Digite aqui um número para saber seu fatorial.')) 

    nResult := nNum

    For nI := nNUm to 2 step -1

            nResult := nResult * (nI-1)
    NEXT

    FwAlertSuccess('O resultado de ' + cValToChar(nNum) + '! é: ' + cValToChar(nResult))

RETURN
