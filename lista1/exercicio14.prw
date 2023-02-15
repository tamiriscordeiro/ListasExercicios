#INCLUDE "TOTVS.CH"

User Function Divisoes()
//- Escreva um algoritmo para ler 2 valores e se o segundo valor informado for ZERO, deve ser lido
//  um novo valor, ou seja, para o segundo valor não pode ser aceito o valor zero. 
// Imprimir o resultado da divisão do primeiro valor lido pelo segundo valor lido.

    local nValor1    := 0
    local nValor2    := 0
    local nResultado := 0

        nValor1 := FwInputBox('Digite o primeiro valor: ')
            nValor1 := val(nValor1)
    
       nValor2 := FwInputBox('Digite o segundo valor: ')
            nValor2 := val(nValor2)

        while nValor2 == 0
            nValor2 := FwInputBox('Digite o segundo valor: ')
                nValor2 := val(nValor2)
        enddo 

        nResultado := nValor1 / nValor2


        FwAlertInfo('O resultado da divisão de  ' + cValToChar(nValor1) + ' por '  + cValToChar(nValor2) + ' é : ' + cValToChar(nResultado))
    
      
Return 
