// 5 – Elaborar um programa que efetue a apresentação do valor da conversão em real (R$) de um valor lido em dólar (US$). 
// O programa deverá solicitar o valor da cotação do dólar e, também, a quantidade de dólares disponível com o usuário. 

#INCLUDE "TOTVS.CH"

User Function CotDolarRS()
    nDolar  := 0
    nReal   := 0
    nTotal  := 0

    nReal := FwInputBox('Digite a cotação atual do dólar em R$: ')
        nReal := val(nReal)

    nDolar:= FwInputBox('Digite o valor que possui em dólares: ')
        nDolar := val(nDolar)

    nTotal := nDolar * nReal

    FwAlertSuccess("O que você possui em dólares é equivalente a R$:  " + alltrim(Str(nTotal)) + " reais.")

Return
