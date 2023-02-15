#INCLUDE "TOTVS.CH"

User Function Conta110()
// - Escreva um algoritmo para imprimir os 10 primeiros números inteiros maiores que 100.

    local nNum := 101

        while nNum <= 110

            FwAlertInfo('Os 10 primeiros numeros inteiros maiores que 100, são : ' + cValToChar(nNum))
                nNum++
        enddo 

        FwAlertInfo('Contagem Encerrada')

Return 
