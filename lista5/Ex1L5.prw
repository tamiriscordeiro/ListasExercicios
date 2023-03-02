#INCLUDE "TOTVS.CH"

User Function Ex1L5()
    local aNome      := {'Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'}
    Local aDias     := {'1','2','3','4','5','6','7'}
    Local nDia      := 0
    Local cDDia  := ''
    Local cDNome  := ''

    nDia := (FwInputBox('Digite um número (entre 1 e 7), para ver o dia da semana: '))
            nDia := val(nDia)

    While nDia <= 0 .or. nDia > 7 //Verifica e garante que o usuário digitou um dia válido;
        FwAlertError('Valor Inválido!')
        nDia := (FwInputBox('Digite um número (entre 1 e 7), para ver o dia da semana: '))
            nDia := val(nDia)
    Enddo

    cDDia := aDias[nDia] //Seleciona o dia correspondente ao digitado dentro da Array aDias
    cDNome := aNome[nDia] //Seleciona o nome do dia correspondente ao digitado dentro da Array aNome

    FwAlertSuccess('O número ' + cDDia + ' equivale a ' + cDNome , 'Dia da Semana') //Mostra para o usuário o nome do dia da semana correspondente ao número digitado.

Return
