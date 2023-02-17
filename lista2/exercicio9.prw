// 9 - Dado um número de 1 até 12, apresentar o número de dias do mês correspondente.
// Se o número escolhido for 2 (fevereiro), considere 28 dias. 
// Dica: O uso de Array pode simplificar as coisas, mas não é obrigatório.

#INCLUDE "TOTVS.CH"

User Function QTDDMes()
    local aMes      := {'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'}
    Local aDias     := {'31','28','31','30','31','30','31','31','30','31','30','31'}
    Local nDia      := 0
    Local cDDia  := ''
    Local cDMes  := ''

    While nDia <= 0 .or. nDia > 12 //Verifica e garante que o usuário digitou um mês válido;
        nDia := (FwInputBox('Digite um mês (valor númerico 1 a 12), para ver quantos dias tem esse mês: '))
            nDia := val(nDia)
    Enddo

    cDDia := aDias[nDia] //Seleciona o dia correspondente ao digitado dentro da Array aDias
    cDMes := aMes[nDia] //Seleciona o mês correspondente ao digitado dentro da Array aMes

    FwAlertSuccess('O mês de ' + cDMes + ' tem ' + cDDia + ' dias.') //Mostra para o usuário a quantidade de dias que tem o mês que ele digitou.

Return
