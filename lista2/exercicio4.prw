// 4 � Ler dois inteiros (A e B) e imprimir o resultado do quadrado da diferen�a do primeiro valor pelo
// segundo.

#INCLUDE "TOTVS.CH"

User Function CadaQuad()
    nDif    := 0
    nA      := 0
    nB      := 0
    nQA     := 0
    nQB     := 0

    nA := FwInputBox('Digite o primeiro valor: ')
        nA := val(nA)
        nQA := nA ^ 2

    nB:= FwInputBox('Digite o segundo valor: ')
        nB := val(nB)
        nQB := nB ^ 2

    nDif := nQA - nQB

    FwAlertSuccess("A diferen�a dos quadrados desses valores �:  " + alltrim(Str(nDif)))

Return
