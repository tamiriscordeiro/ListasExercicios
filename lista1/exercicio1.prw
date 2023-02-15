#INCLUDE "TOTVS.CH"

User Function Antecessor()
//Escreva um algoritmo para ler um valor e escrever o seu antecessor.

local cNumero       := "" 
local nAntecessor   := 0

    cNumero := FwInputBox('Digite um numero:', cNumero) //Recebe o número que o usuário digitar

    nAntecessor := val(cNumero) - 1 //Calcula o antecessor do número digitado pelo usuário
    

    FwAlertSuccess('O antecessor do numero ' + cNumero + ' eh: ' + cValToChar(nAntecessor) + '!') //Mostra para o usuário o antecessor do número que ele digitou
        
Return 
