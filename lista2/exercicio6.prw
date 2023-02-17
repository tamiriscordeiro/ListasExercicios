// – Efetuar a leitura de quatro números inteiros e apresentar os números que são divisíveis por 2 e 3.

#INCLUDE "TOTVS.CH"

User Function Modulo2e3()
    local nNum   := 0
    local aDiv   := {}
    local cShow  := ''
    local nCont  := 0
    local nWait  := 0

    while nCont < 4
        
        nNum := FwInputBox('Digite um número: ')
            nNum := val(nNum)
            nWait := nNum

        if (nWait % 2 == 0) .AND. (nWait % 3 == 0)
            aAdd(aDiv, nWait)
                nCont++
            else
                nCont++
        endif
    enddo
    
    for nCont := 1 to len(aDiv)
        cShow += (Alltrim(STR(aDiv[nCont])) + ' ')
    next
    
    FwAlertSuccess("Os números divisíveis por 2 e 3 são:  " + cShow)

Return
