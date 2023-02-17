// 2- Efetuar o cálculo da quantidade de litros de combustível gastos em uma viagem, utilizando-se
// um automóvel que faz 12 Km por litro. Para obter o cálculo, o usuário deverá fornecer o tempo gasto
// na viagem e a velocidade média durante a mesma. Desta forma, será possível obter a distância percorrida com a fórmula:
// DISTÂNCIA = TEMPO x VELOCIDADE.
// Tendo o valor da distância, basta calcular a quantidade de litros de combustível utilizada na viagem com a fórmula:
// LITROS_USADOS = DISTÂNCIA / 12.
// O programa deverá apresentar os valores da velocidade média, tempo gasto na vigem, a distância percorrida e 
// a quantidade de litros utilizada na viagem.

#INCLUDE "TOTVS.CH"

User Function KMViagem12()
    nLitros     := 0
    nTempo      := 0
    nVelMed     := 0
    nDistancia  := 0

    nTempo := FwInputBox('Digite o tempo gasto na viagem (h): ')
        nTempo := val(nTempo)

    nVelMed := FwInputBox('Digite a velocidade media durante a viagem (km/h): ')
        nVelMed := val(nVelMed)

    nDistancia := nTempo * nVelMed

    nLitros := nDistancia / 12

    FwAlertSuccess("Velocidade Média:  " + alltrim(Str(nVelMed)) +  " km/h " + CRLF + "Tempo Gasto na Viagem: " + alltrim(Str(nTempo)) + " h " + CRLF + "Distância Percorrida: "  + alltrim(Str(nDistancia)) + "km " + CRLF + "Quantidade de Litros Gastos na Viagem:  " + alltrim(Str(nLitros)) + "L " , "Resumo da Viagem")

Return
