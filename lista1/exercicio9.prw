#INCLUDE "TOTVS.CH"

//- Ler um valor e escrever se � positivo, negativo ou zero

User Function ChecaNum()

local cNum  := ""
local nNum  := 0

    cNum := FwInputBox('Digite um numero:', cNum)
        nNum := val(cNum)
    
    if nNum > 0
        FwAlertSuccess('O numero ' + cValToChar(nNum) + ' � positivo!')
    elseif nNum = 0
        FwAlertSuccess('O numero ' + cValToChar(nNum) + ' � zero!')
    else
        FwAlertSuccess('O numero ' + cValToChar(nNum) + ' � negativo!')
    endif
      
Return 
