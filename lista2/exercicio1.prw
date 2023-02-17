#INCLUDE "TOTVS.CH"

//1 – Ler dois números positivos e apresentar a soma, diferença, produto e quociente entre eles.

User Function EhCalculadora()
    nNum1    := 0
    nNum2    := 0
    nSoma    := 0
    nDivisao := 0
    nMult    := 0
    nDif     := 0

    nNum1 := FwInputBox('Digite o primeiro valor positivo')
        nNum1 := val(nNum1)

    while nNum1 < 0
        FwAlertError('Valor Incorreto!')
            nNum1 := FwInputBox('Digite o primeiro valor positivo')
                nNum1 := val(nNum1)
    enddo

    nNum2 := FwInputBox('Digite o segundo valor positivo')
        nNum2 := val(nNum2)

    while nNum2 < 0
        FwAlertError('Valor Incorreto!')
            nNum2 := FwInputBox('Digite o segundo valor positivo')
                nNum2 := val(nNum2)
    enddo

    nSoma := nNum1 + nNum2

    nDivisao := nNum1 / nNum2

    nMult := nNum1 * nNum2

    nDif := nNum1 - nNum2

    FwAlertSuccess("Soma:  " + alltrim(Str(nNum1)) + " + " + alltrim(Str(nNum2)) +  " = " + alltrim(Str(nSoma)) + CRLF + "Divisão:  " + alltrim(Str(nNum1)) + " / " + alltrim(Str(nNum2)) +  " = " + alltrim(Str(nDivisao)) + CRLF + "Multiplicação:  " + alltrim(Str(nNum1)) + " * " + alltrim(Str(nNum2)) +  " = " + alltrim(Str(nMult)) + CRLF + "Diferença:  " + alltrim(Str(nNum1)) + " - " + alltrim(Str(nNum2)) +  " = " + alltrim(Str(nDif)))   

Return
