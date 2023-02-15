#INCLUDE "TOTVS.CH"

//-- A jornada de trabalho semanal de um funcion�rio � de 40 horas. 
// O funcion�rio que trabalhar mais de 40 horas receber� hora extra, cujo c�lculo � o valor da hora regular com um
// acr�scimo de 50%. Escreva um algoritmo que leia o n�mero de horas trabalhadas em um m�s, o sal�rio por hora e
// escreva o sal�rio total do funcion�rio, que dever� ser acrescido das horas extras, caso tenham sido trabalhadas 
// (considere que o m�s possua 4 semanas exatas).

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

    FwAlertSuccess('O sal�rio do funcion�rio � R$ ' + cValToChar(NoRound(nSalario,2)) + '!')
      
Return 
