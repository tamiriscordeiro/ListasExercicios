#INCLUDE "TOTVS.CH"

User Function Antecessor()
//Escreva um algoritmo para ler um valor e escrever o seu antecessor.

local cNumero       := "" 
local nAntecessor   := 0

    cNumero := FwInputBox('Digite um numero:', cNumero) //Recebe o n�mero que o usu�rio digitar

    nAntecessor := val(cNumero) - 1 //Calcula o antecessor do n�mero digitado pelo usu�rio
    

    FwAlertSuccess('O antecessor do numero ' + cNumero + ' eh: ' + cValToChar(nAntecessor) + '!') //Mostra para o usu�rio o antecessor do n�mero que ele digitou
        
Return 
