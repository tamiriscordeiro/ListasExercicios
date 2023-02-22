// 13 � Desenvolva uma fun��o que leia um n�mero e exiba o dia da semana correspondente, por exemplo:
// 1 � Domingo
// 2 � Segunda...
// � necess�rio avisar o usu�rio caso ele digite um valor � inv�lido. Obs: Utilize Array 

#INCLUDE "TOTVS.CH"

User Function DiaSemana()
    local aNome      := {'Domingo', 'Segunda-feira', 'Ter�a-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S�bado'}
    Local aDias     := {'1','2','3','4','5','6','7'}
    Local nDia      := 0
    Local cDDia  := ''
    Local cDNome  := ''

    nDia := (FwInputBox('Digite um dia (valor n�merico 1 a 7), para ver o dia da semana: '))
            nDia := val(nDia)

    While nDia <= 0 .or. nDia > 7 //Verifica e garante que o usu�rio digitou um dia v�lido;
        FwAlertError('Valor Inv�lido!')
        nDia := (FwInputBox('Digite um dia (valor n�merico 1 a 7), para ver o dia da semana: '))
            nDia := val(nDia)
    Enddo

    cDDia := aDias[nDia] //Seleciona o dia correspondente ao digitado dentro da Array aDias
    cDNome := aNome[nDia] //Seleciona o nome do dia correspondente ao digitado dentro da Array aNome

    FwAlertSuccess('O n�mero ' + cDDia + ' equivale a ' + cDNome) //Mostra para o usu�rio o nome do dia da semana correspondente ao n�mero digitado.

Return
