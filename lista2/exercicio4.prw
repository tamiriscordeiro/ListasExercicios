// 4 � Ler dois inteiros (A e B) e imprimir o resultado do quadrado da diferen�a do primeiro valor pelo
// segundo.

#INCLUDE "TOTVS.CH"

User Function CadaQuad()
    nDif    := 0
    nA      := 0
    nB      := 0
    nQuad   := 0

    nA := FwInputBox('Digite o primeiro valor: ')
        nA := val(nA)

    nB:= FwInputBox('Digite o segundo valor: ')
        nB := val(nB)

    nDif := ((nA) - (nB))

    nQuad := nDif ^ 2

    FwAlertSuccess("A diferen�a dos quadrados desses valores �:  " + alltrim(Str(nQuad)))

Return
