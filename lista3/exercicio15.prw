// - Desenvolva um programa que receba a temperatura m�dia de cada m�s do ano e armazene-as em um array. 
// Ap�s isso, calcule a m�dia de temperatura anual e mostre todas as temperaturas acima da m�dia anual 
// e em que m�s ocorreram exemplo:
// M�dia Anual: 28 Graus
// Fevereiro: 29 Graus
// Novembro: 31 Graus

#INCLUDE "TOTVS.CH"

User Function TempMensal()
    local aMes      := {'Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'}
    Local aTemp     := {}
    Local nTemp     := 0
    Local nMedia    := 0
    local nSoma     := 0
    local nCont     := 1
    local cShow     := ''
    local nI        := 0


    for nCont := 1 to 12  //Conta at� 12 para preencher as temperaturas m�dias;
        nTemp := (FwInputBox('Digite a temperatura m�dia do m�s de ' + aMes[nCont] + ': '))
            nTemp := val(nTemp)
            aADD(aTemp , nTemp) //Insere os valores digitados na array.

            nSoma += nTemp
    next

    nMedia := nSoma / 12

    for nI := 1 to 12 //Percorre a array de temperatura procurando as temperaturas mais altas que a m�dia.
        if aTemp[nI] > nMedia
            cShow += ('  ' + aMes[nI] + ' ' +  Alltrim(STR(aTemp[nI])) + ' �C' + CRLF) //Armazena a temperatura mais alta e o m�s correspondente em uma string.
        endif
    next

    FwAlertSuccess('A temperatura m�dia desse ano foi : ' + cValToChar(nMedia) + '�C' + CRLF + ;
    'Os meses com temperatura acima da m�dia foram: ' + CRLF + cShow) //Mostra para o usu�rio a m�dia anual e os meses com temperatura acima da m�dia.

Return
