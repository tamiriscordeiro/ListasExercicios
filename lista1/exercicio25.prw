#INCLUDE "TOTVS.CH"

// - Escreva um algoritmo para ler 10 números e ao final da leitura escrever a soma total dos 10 números lidos.

User Function Somando()

    local nNum   := 0
    local nSoma  := 0
    local nCont  := 1

        while nCont <= 10

           nNum := FwInputBox('Digite um numero : ')
                nNum := val(nNum)

            nSoma := nSoma + nNum

            nCont++
        enddo 

        FwAlertInfo('A soma dos valores digitados é ' + cValToChar(nSoma))

Return 
