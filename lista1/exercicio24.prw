#INCLUDE "TOTVS.CH"

// - Ler 10 valores e escrever quantos desses valores lidos estão no intervalo [10, 20] 
// (inlcuindo os valores 10 e 20 no intervalo) e quantos deles estão fora deste intervalo.

User Function Intervalo()

    local nNum  := 0
    local nSim  := 0
    local nNao  := 0
    local nCont := 1

        while nCont <= 10

           nNum := FwInputBox('Digite um numero : ')
                nNum := val(nNum)

            if nNum >= 10 .AND. Nnum <= 20
                nSim ++
                
                else
                    nNao ++
            endif

            nCont++
        enddo 

        FwAlertInfo('Você digitou ' + cValToChar(nSim) + ' números dentro do intervalo de 10 a 20 e ' + cValToChar(nNao) + ' fora do intervalo ' )

Return 
