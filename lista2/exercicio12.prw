// 12 - Elaborar um programa que exiba na tela automaticamente todos os m�ltiplos de 3
// existentes entre 1 e 100.

#INCLUDE "TOTVS.CH"

User Function Mult3()
    local nCont := 0
    local cShow := ""

    for nCont := 1 to 100
        if (nCont % 3 == 0)
            cShow := cShow + CVALTOCHAR(nCont) + ' , '
        endif 
    next 
    
    FwAlertSuccess('O n�meros divis�veis por 3 entre 1 e 100 s�o: ' + cShow)

Return
