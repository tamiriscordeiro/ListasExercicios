#INCLUDE "TOTVS.CH"

User Function AreaTriangulo()
//- Escreva um algoritmo para ler as dimens�es de um ret�ngulo (base e altura), calcular e escrever
// a �rea desse ret�ngulo..

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

    FwAlertSuccess('A �rea desse tri�ngulo � ' + cValToChar(nArea) + 'cm�!')
        
Return 
