#INCLUDE "TOTVS.CH"

User Function Divide()
//- Acrescentar uma mensagem de 'VALOR INV�LIDO' no exerc�cio anterior caso o segundo valor informado seja ZERO.

    local nValor1    := 0
    local nValor2    := 0
    local nResultado := 0

        nValor1 := FwInputBox('Digite o primeiro valor: ')
            nValor1 := val(nValor1)
    
       nValor2 := FwInputBox('Digite o segundo valor: ')
            nValor2 := val(nValor2)

        while nValor2 == 0
            FwAlertError('VALOR INV�LIDO')
            nValor2 := FwInputBox('Digite o segundo valor: ')
                nValor2 := val(nValor2)
        enddo 

        nResultado := nValor1 / nValor2


        FwAlertInfo('O resultado da divis�o de  ' + cValToChar(nValor1) + ' por '  + cValToChar(nValor2) + ' � : ' + cValToChar(nResultado))
         
Return 
