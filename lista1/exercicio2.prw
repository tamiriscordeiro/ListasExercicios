#INCLUDE "TOTVS.CH"

User Function AreaTriangulo()
//- Escreva um algoritmo para ler as dimensões de um retângulo (base e altura), calcular e escrever
// a área desse retângulo..

local cBase     := ""
local nBase     := 0
local cAltura   := ""
local nAltura   := 0
local nArea     := 0

    cBase := FwInputBox('Digite a base do triangulo:', cBase) 
        nBase := val(cBase)
    
    cAltura := FwInputBox('Digite a altura do triangulo:', cAltura)
        nAltura := val(cAltura)

    nArea := nBase * nAltura

    FwAlertSuccess('A área desse triângulo é ' + cValToChar(nArea) + 'cm²!')
        
Return 
