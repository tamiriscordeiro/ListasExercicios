#INCLUDE "TOTVS.CH"

User Function Reajuste()
//- Escreva um algoritmo para ler o sal�rio mensal atual de um funcion�rio e o percentual de reajuste. 
// Calcular e escrever o valor do novo sal�rio.

    local cSalario     := ""
    local nSalario     := 0
    local cReajuste    := ""
    local nReajuste    := 0
    local nAumento     := 0
    local nNovoSalario := 0

        cSalario := FwInputBox('Digite o valor do salario:', cSalario)
            nSalario := val(cSalario)

        cReajuste := FwInputBox('Digite o percentual de Reajuste:', cReajuste)
            nReajuste := val(cReajuste)
    
        nAumento := (nSalario / 100) * nReajuste
        nNovoSalario := nSalario + nAumento

    FwAlertSuccess('O novo valor do sal�rio � ' + cValToChar(nNovoSalario) + '!')
      
Return 
