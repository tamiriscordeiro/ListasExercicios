#INCLUDE "TOTVS.CH"

//-- A jornada de trabalho semanal de um funcionário é de 40 horas. 
// O funcionário que trabalhar mais de 40 horas receberá hora extra, cujo cálculo é o valor da hora regular com um
// acréscimo de 50%. Escreva um algoritmo que leia o número de horas trabalhadas em um mês, o salário por hora e
// escreva o salário total do funcionário, que deverá ser acrescido das horas extras, caso tenham sido trabalhadas 
// (considere que o mês possua 4 semanas exatas).

User Function SalarioTotal()

local cHoraReg  := ""
local nHoraReg  := 0
local nBancoHora:= 0
local cSemana   := ""
local nSemana   := 0
local nCont     := 0
local nHoraEx   := 0
local nSalario  := 0

    cHoraReg := FwInputBox('Valor por horas trabalhadas:', cHoraReg)
        nHoraReg := val(cHoraReg)
    
    while nCont < 4
        cSemana := FwInputBox('Digite as horas trabalhadas na semana:', cSemana)
            nSemana := val(cSemana)
   
        nBancoHora := nBancoHora + nSemana
        nCont ++
    enddo 

    if nBancoHora > 160
        nHoraEx  := (nBancoHora - 160) * (nHoraReg * 0.5)
        nSalario := (nBancoHora * nHoraReg) + nHoraEx
    else
        nSalario := nBancoHora * nHoraReg
    endif 

    FwAlertSuccess('O salário do funcionário é R$ ' + cValToChar(NoRound(nSalario,2)) + '!')
      
Return 
