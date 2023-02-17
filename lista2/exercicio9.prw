// 9 - Dado um n�mero de 1 at� 12, apresentar o n�mero de dias do m�s correspondente.
// Se o n�mero escolhido for 2 (fevereiro), considere 28 dias. 
// Dica: O uso de Array pode simplificar as coisas, mas n�o � obrigat�rio.

#INCLUDE "TOTVS.CH"

User Function QTDDMes()
    local aMes      := {'Janeiro', 'Fevereiro', 'Mar�o', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'}
    Local aDias     := {'31','28','31','30','31','30','31','31','30','31','30','31'}
    Local nDia      := 0
    Local cDDia  := ''
    Local cDMes  := ''

    While nDia <= 0 .or. nDia > 12 //Verifica e garante que o usu�rio digitou um m�s v�lido;
        nDia := (FwInputBox('Digite um m�s (valor n�merico 1 a 12), para ver quantos dias tem esse m�s: '))
            nDia := val(nDia)
    Enddo

    cDDia := aDias[nDia] //Seleciona o dia correspondente ao digitado dentro da Array aDias
    cDMes := aMes[nDia] //Seleciona o m�s correspondente ao digitado dentro da Array aMes

    FwAlertSuccess('O m�s de ' + cDMes + ' tem ' + cDDia + ' dias.') //Mostra para o usu�rio a quantidade de dias que tem o m�s que ele digitou.

Return
