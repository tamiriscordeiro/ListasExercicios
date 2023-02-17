// 10 - Efetuar a leitura de 5 valores inteiros e exibir na tela o menor e o maior deles.

#INCLUDE "TOTVS.CH"

User Function MaiorMenor()
    local aNum     [5]
    local nMenor := 0
    local nMaior := 0
    local nCont  := 0

    for nCont := 1 to 5
        aNum[nCont] := val(FwInputBox('Digite um número: '))
    next

    aSort(aNum)

    nMenor := aNum[1]
    nMaior := aNum[5]

    FwAlertSuccess('O menor valor é ' + alltrim(str(nMenor)) + CRLF + ' e o maior valor é ' + alltrim(str(nMaior))) 

Return
