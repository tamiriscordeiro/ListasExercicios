// 13 – Desenvolva uma função que leia um número e exiba o dia da semana correspondente, por exemplo:
// 1 – Domingo
// 2 – Segunda...
// É necessário avisar o usuário caso ele digite um valor é inválido. Obs: Utilize Array 

#INCLUDE "TOTVS.CH"

User Function DiaSemana()
    local aNome      := {'Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'}
    Local aDias     := {'1','2','3','4','5','6','7'}
    Local nDia      := 0
    Local cDDia  := ''
    Local cDNome  := ''

    nDia := (FwInputBox('Digite um dia (valor númerico 1 a 7), para ver o dia da semana: '))
            nDia := val(nDia)

    While nDia <= 0 .or. nDia > 7 //Verifica e garante que o usuário digitou um dia válido;
        FwAlertError('Valor Inválido!')
        nDia := (FwInputBox('Digite um dia (valor númerico 1 a 7), para ver o dia da semana: '))
            nDia := val(nDia)
    Enddo

    cDDia := aDias[nDia] //Seleciona o dia correspondente ao digitado dentro da Array aDias
    cDNome := aNome[nDia] //Seleciona o nome do dia correspondente ao digitado dentro da Array aNome

    FwAlertSuccess('O número ' + cDDia + ' equivale a ' + cDNome) //Mostra para o usuário o nome do dia da semana correspondente ao número digitado.

Return
