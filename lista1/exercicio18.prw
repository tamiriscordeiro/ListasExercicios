#INCLUDE "TOTVS.CH"

User Function ContaCrescente()
// - Escreva um algoritmo para imprimir os números de 1 (inclusive) a 10 (inclusive) em ordem crescente.

    local nNum    := 1

        while nNum <= 10

            FwAlertInfo('Contagem Crescente em: ' + cValToChar(nNum))
                nNum++
        enddo 

        FwAlertInfo('Contagem Encerrada')

Return 
