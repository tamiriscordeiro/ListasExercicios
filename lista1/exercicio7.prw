#INCLUDE "TOTVS.CH"

//-7 - As maçãs custam R$ 1,30 cada se forem compradas menos de uma dúzia,
// e R$ 1,00 se forem compradas pelo menos 12. 
// Escreva um programa que leia o número de maçãs compradas, calcule e escreva o custo total da compra.

User Function Apples()

    local cQuant   := ""
    local nQuant   := 0
    local nTotal   := 0

        cQuant := FwInputBox('Digite quantas maçãs quer comprar:', cQuant)
            nQuant := val(cQuant)
   
        if (nQuant < 12)
            nTotal := nQuant * 1.30
        else
            nTotal := nQuant * 1
        endif

    FwAlertSuccess('O valor total é ' + cValToChar(nTotal) + '!')
      
Return 
