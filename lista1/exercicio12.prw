#INCLUDE "TOTVS.CH"

// Ler o nome de 2 times e o n�mero de gols marcados na partida (para cada time). 
// Escrever o nome do vencedor. 
// Caso n�o haja vencedor dever� ser impressa a palavra EMPATE.

User Function Campeao()

    local cTimeA    := ""
    local cTimeB    := ""
    local nVitA     := 0
    local nVitB     := 0

        cTimeA := FwInputBox('Digite o primeiro time: ', cTimeA)

        nVitA := FwInputBox('Digite o n�mero de vit�rias do primeiro time: ')
            nVitA := val(nVitA)

        cTimeB := FwInputBox('Digite o segundo time: ', cTimeB)

        nVitB  := FwInputBox('Digite o n�mero de vit�rias do segundo time: ')
            nVitB := val(nVitB)

        if (nVitB > nVitA)
            FwAlertSuccess('Quem ganhou a competi��o foi o time: ' + cTimeB)
        elseif (nVitA > nVitB)
            FwAlertSuccess('Quem ganhou a competi��o foi o time: ' + cTimeA)
        else
            FwAlertSuccess('EMPATE!')
        endif
Return
