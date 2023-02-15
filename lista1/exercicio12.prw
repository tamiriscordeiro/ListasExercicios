#INCLUDE "TOTVS.CH"

// Ler o nome de 2 times e o número de gols marcados na partida (para cada time). 
// Escrever o nome do vencedor. 
// Caso não haja vencedor deverá ser impressa a palavra EMPATE.

User Function Campeao()

    local cTimeA    := ""
    local cTimeB    := ""
    local nVitA     := 0
    local nVitB     := 0

        cTimeA := FwInputBox('Digite o primeiro time: ', cTimeA)

        nVitA := FwInputBox('Digite o número de vitórias do primeiro time: ')
            nVitA := val(nVitA)

        cTimeB := FwInputBox('Digite o segundo time: ', cTimeB)

        nVitB  := FwInputBox('Digite o número de vitórias do segundo time: ')
            nVitB := val(nVitB)

        if (nVitB > nVitA)
            FwAlertSuccess('Quem ganhou a competição foi o time: ' + cTimeB)
        elseif (nVitA > nVitB)
            FwAlertSuccess('Quem ganhou a competição foi o time: ' + cTimeA)
        else
            FwAlertSuccess('EMPATE!')
        endif
Return
