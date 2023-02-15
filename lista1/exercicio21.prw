#INCLUDE "TOTVS.CH"

User Function ContaAte()
// - Ler um valor N e imprimir todos os valores inteiros entre 1 (inclusive) e N (inclusive).
// Considere que o N será sempre maior que ZERO

    local nNum  := 0
    local nCont := 1

        nNum := FwInputBox('Digite até que número quer que o programa conte : ')
            nNum := val(nNum) 

        while nNum == 0
           FwAlertInfo('VALOR INVALIDO!')

           nNum := FwInputBox('Digite até que número quer que o programa conte : ')
                nNum := val(nNum)
        enddo 

        while nCont <= nNum

            FwAlertInfo('Contando até ' + cValToChar(nNum) + ' : ' + cValToChar(nCont))
                nCont++
        enddo 

        FwAlertInfo('Contagem Encerrada')

Return 
