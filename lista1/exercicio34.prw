#INCLUDE "TOTVS.CH"

//  - Faça um programa que receba a idade e o peso de sete pessoas. Calcule e mostre:
// o A quantidade de pessoas com mais de 90 quilos
// o A média das idades das sete pessoas

User Function Pessoas()
    Local nIdade     := 0
    Local nSomaIdade := 0
    Local nPeso      := 0
    Local nPeso90    := 0
    Local nMedia     := 0
    local nI         := 0

    For nI := 1 to 7
        nIdade := Val(FwInputBox('Digite aqui a idade da ' + AllTrim(STR(nI)) + 'ª pessoa.'))
            nSomaIdade += nIdade

        nPeso := Val(FwInputBox('Digite aqui o peso da  ' + AllTrim(STR(nI)) + 'ª pessoa.'))

        If nPeso > 90
            nPeso90++
        Endif
    Next

    nMedia := nSomaIdade / 7

    FwAlertSuccess('A média da idade das pessoas é: ' + cValToChar(nMedia))

    FwAlertSuccess('Pessoas com mais de 90 quilos: ' + cValToChar(nPeso90))
Return
