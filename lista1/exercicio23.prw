#INCLUDE "TOTVS.CH"

User Function EhNegativo()
// - - Ler 10 valores e escrever quantos desses valores lidos s�o NEGATIVOS.

    local nNum       := 0
    local nNegativo  := 0
    local nCont      := 0

        while nCont <= 10

           nNum := FwInputBox('Digite um numero : ')
                nNum := val(nNum)

            if nNum < 0
                nNegativo ++
            endif

            nCont++
        enddo 

        FwAlertInfo('Voc� digitou ' + cValToChar(nNegativo) + ' n�meros negativos!')

Return 
