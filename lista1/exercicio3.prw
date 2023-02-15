#INCLUDE "TOTVS.CH"

User Function IdadeEmDias()
//- Faça um algoritmo que leia a idade de uma pessoa expressa em anos, meses e dias 
// e escreva a idade dessa pessoa expressa apenas em dias.
// Considerar ano com 365 dias e mês com 30 dias

local cAnos     := ""
local nAnos     := 0
local cMeses    := ""
local nMeses    := 0
local cDias     := ""
local nDias     := 0
local nIdade    := 0

    cAnos := FwInputBox('Anos:', cAnos , 'Digite a sua idade em:')
        nAnos := val(cAnos)

    cMeses := FwInputBox('Meses:', cMeses , 'Digite a sua idade em:')
        nMeses := val(cMeses)
    
    cDias := FwInputBox('Dias:', cDias , 'Digite a sua idade em:')
        nDias := val(cDias)

    nIdade:= ((nAnos * 365) + (nMeses * 30) + nDias)

    FwAlertSuccess('Sua idade em dias é ' + cValToChar(nIdade) + '!')
      
Return 
