#INCLUDE "TOTVS.CH"

//-Escreva um algoritmo para ler uma temperatura em graus Fahrenheit, calcular e escrever o valor
// correspondente em graus Celsius.

User Function Fahrenheit()

    local cFahrenheit     := ""
    local nFahrenheit     := 0
    local nCelsius        := 0 

        cFahrenheit := FwInputBox('Digite a temperatura em Fahrenheit:', cFahrenheit)
            nFahrenheit := val(cFahrenheit)
   
        nCelsius := (nFahrenheit - 32) * (5/9)

        FwAlertSuccess('A temperatura em Celsius é ' + cValToChar(nCelsius) + '!')
      
Return 
