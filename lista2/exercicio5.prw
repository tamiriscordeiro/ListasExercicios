// 5 � Elaborar um programa que efetue a apresenta��o do valor da convers�o em real (R$) de um valor lido em d�lar (US$). 
// O programa dever� solicitar o valor da cota��o do d�lar e, tamb�m, a quantidade de d�lares dispon�vel com o usu�rio. 

#INCLUDE "TOTVS.CH"

User Function CotDolarRS()
    nDolar  := 0
    nReal   := 0
    nTotal  := 0

    nReal := FwInputBox('Digite a cota��o atual do d�lar em R$: ')
        nReal := val(nReal)

    nDolar:= FwInputBox('Digite o valor que possui em d�lares: ')
        nDolar := val(nDolar)

    nTotal := nDolar * nReal

    FwAlertSuccess("O que voc� possui em d�lares � equivalente a R$:  " + alltrim(Str(nTotal)) + " reais.")

Return
