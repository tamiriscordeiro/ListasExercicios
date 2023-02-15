#INCLUDE "TOTVS.CH"

//- Faça um programa que receba a idade de dez pessoas e que calcule e mostre a quantidade de
// pessoas com idade maior ou igual a 18 anos.

User Function MaiorIdade()
    local nIdade := 0
    local nMaior := 0
    local nI     := 0

    For nI := 1 to 10
        nIdade := val(FwInputBox("Digite a idade da " + cvaltochar(nI) + "ª pessoa."))

        if nIdade >= 18
            nMaior++
        endif
    Next

    FwAlertSuccess(cvaltochar(nMaior) + " pessoas são maiores de idade.")

Return
