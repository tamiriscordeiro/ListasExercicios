// 3 – Alterar o programa do exercício anterior de modo que ele possa ser usado em veículos com
// padrão de consumo diferente de 12 Km por litro.

#INCLUDE "TOTVS.CH"

User Function MorKMViagem()
    nLitros     := 0
    nTempo      := 0
    nVelMed     := 0
    nDistancia  := 0
    nKmLitro    := 0

    nKmLitro := FwInputBox('Digite quantos km por litro o seu carro faz: ')
        nKmLitro := val(nKmLitro)

    nTempo := FwInputBox('Digite o tempo gasto na viagem (h): ')
        nTempo := val(nTempo)

    nVelMed := FwInputBox('Digite a velocidade media durante a viagem (km/h): ')
        nVelMed := val(nVelMed)

    nDistancia := nTempo * nVelMed

    nLitros := nDistancia / nKmLitro

    FwAlertSuccess("Velocidade Média:  " + alltrim(Str(nVelMed)) +  " km/h " + CRLF + "Tempo Gasto na Viagem: " + alltrim(Str(nTempo)) + " h " + CRLF + "Distância Percorrida: "  + alltrim(Str(nDistancia)) + "km " + CRLF + "Quantidade de Litros Gastos na Viagem:  " + alltrim(Str(nLitros)) + "L " , "Resumo da Viagem")

Return
