#INCLUDE "TOTVS.CH"

// - Faça um algoritmo para ler dois arrays aArray1 e aArray2 de 15 números cada. 
// Calcular e escrever a quantidade de vezes que aArray1 e aArray2 possuem os mesmos números e nas mesmas
// posições.

User Function MesmoNumPos()

    local aArray1   := {}
    local aArray2   := {}
    local nI        := 0
    local nUser     := 0
    local cPosScan  := ''
    local nJ        := 0

    
    For nI := 1 to 15
        nUser := Val(FwInputBox('Digite o número para o primeiro array: ' + cvaltochar(nI) + '/15'))
        aAdd(aArray1, nUser)
    next
    
    For nI := 1 to 15
        nUser := Val(FwInputBox('Digite o número para o segundo array: ' + cvaltochar(nI) + '/15'))
        aAdd(aArray2, nUser)
    Next

    For nI := 1 to 15
        
        if (aArray1[nI]) == (aArray2[nI])
                cPosScan += cvaltochar(nI) + ' ; '
                nJ++
        endif
    Next

    if nJ > 0
        FwAlertInfo('Os arrays possuem números iguais nas posições:' + cPosScan)
    else
        FwAlertError('Não existem números em posições iguais entre os arrays.')
    endif 
Return
