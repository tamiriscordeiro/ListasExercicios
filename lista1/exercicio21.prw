#INCLUDE "TOTVS.CH"

User Function ContaAte()
// - Ler um valor N e imprimir todos os valores inteiros entre 1 (inclusive) e N (inclusive).
// Considere que o N ser� sempre maior que ZERO

    local nNum  := 0
    local nCont := 1

        nNum := FwInputBox('Digite at� que n�mero quer que o programa conte : ')
            nNum := val(nNum) 

        while nNum == 0
           FwAlertInfo('VALOR INVALIDO!')

           nNum := FwInputBox('Digite at� que n�mero quer que o programa conte : ')
                nNum := val(nNum)
        enddo 

        while nCont <= nNum

            FwAlertInfo('Contando at� ' + cValToChar(nNum) + ' : ' + cValToChar(nCont))
                nCont++
        enddo 

        FwAlertInfo('Contagem Encerrada')

Return 
