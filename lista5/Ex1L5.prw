#INCLUDE "TOTVS.CH"

User Function Ex1L5()
    local aNome      := {'Domingo', 'Segunda-feira', 'Ter�a-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S�bado'}
    Local aDias     := {'1','2','3','4','5','6','7'}
    Local nDia      := 0
    Local cDDia  := ''
    Local cDNome  := ''

    nDia := (FwInputBox('Digite um n�mero (entre 1 e 7), para ver o dia da semana: '))
            nDia := val(nDia)

    While nDia <= 0 .or. nDia > 7 //Verifica e garante que o usu�rio digitou um dia v�lido;
        FwAlertError('Valor Inv�lido!')
        nDia := (FwInputBox('Digite um n�mero (entre 1 e 7), para ver o dia da semana: '))
            nDia := val(nDia)
    Enddo

    cDDia := aDias[nDia] //Seleciona o dia correspondente ao digitado dentro da Array aDias
    cDNome := aNome[nDia] //Seleciona o nome do dia correspondente ao digitado dentro da Array aNome

    FwAlertSuccess('O n�mero ' + cDDia + ' equivale a ' + cDNome , 'Dia da Semana') //Mostra para o usu�rio o nome do dia da semana correspondente ao n�mero digitado.

Return
