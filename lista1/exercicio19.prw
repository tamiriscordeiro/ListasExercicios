#INCLUDE "TOTVS.CH"

User Function ContaDecrescente()
// - Escreva um algoritmo para imprimir os números de 1 (inclusive) a 10 (inclusive) em ordem decrescente.

    local nNum := 10

        while nNum >= 1

            FwAlertInfo('Contagem Decrescente em: ' + cValToChar(nNum))
                nNum--
        enddo 

        FwAlertInfo('Contagem Encerrada')

Return 
