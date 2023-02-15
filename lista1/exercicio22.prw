#INCLUDE "TOTVS.CH"

User Function TabuadaAte10()
// - Ler um valor inteiro (aceitar somente valores entre 1 e 10) e escrever a tabuada de 1 a 10 do valor lido.

    local nNum       := 0
    local nCont      := 1
    local nResultado := 0

        nNum := FwInputBox('Digite qual tabuada de qual número entre 1 e 10 quer saber : ')
            nNum := val(nNum) 

        while nNum < 1 .OR. nNum > 10
           FwAlertInfo('VALOR INVALIDO!')

           nNum := FwInputBox('Digite qual tabuada de qual número entre 1 e 10 quer saber : ')
                nNum := val(nNum)
        enddo 

        while nCont <= 10

            nResultado := nNum * nCont

            FwAlertInfo(cValToChar(nNum) + ' x ' + cValToChar(nCont) + ' = ' + cValToChar(nResultado))

                nCont++
        enddo 

        FwAlertInfo('Tabuada Encerrada')

Return 
