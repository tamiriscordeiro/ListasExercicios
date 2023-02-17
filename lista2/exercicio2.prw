// 2- Efetuar o c�lculo da quantidade de litros de combust�vel gastos em uma viagem, utilizando-se
// um autom�vel que faz 12 Km por litro. Para obter o c�lculo, o usu�rio dever� fornecer o tempo gasto
// na viagem e a velocidade m�dia durante a mesma. Desta forma, ser� poss�vel obter a dist�ncia percorrida com a f�rmula:
// DIST�NCIA = TEMPO x VELOCIDADE.
// Tendo o valor da dist�ncia, basta calcular a quantidade de litros de combust�vel utilizada na viagem com a f�rmula:
// LITROS_USADOS = DIST�NCIA / 12.
// O programa dever� apresentar os valores da velocidade m�dia, tempo gasto na vigem, a dist�ncia percorrida e 
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

    FwAlertSuccess("Velocidade M�dia:  " + alltrim(Str(nVelMed)) +  " km/h " + CRLF + "Tempo Gasto na Viagem: " + alltrim(Str(nTempo)) + " h " + CRLF + "Dist�ncia Percorrida: "  + alltrim(Str(nDistancia)) + "km " + CRLF + "Quantidade de Litros Gastos na Viagem:  " + alltrim(Str(nLitros)) + "L " , "Resumo da Viagem")

Return
