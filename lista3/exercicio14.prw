// 14 � Fa�a uma fun��o que que leia um array de 5 n�meros inteiros e mostre-os numa string.

#INCLUDE "TOTVS.CH"

User Function VetString()
    local aVet      := {}
    Local nNum      := 0
    Local cNum      := ''
    Local nCont     := ''


    for nCont := 1 to 5  //Conta at� 5 para preencher o vetor com 5 n�meros;
        nNum := (FwInputBox('Digite um n�mero inteiro: '))
            nNum := val(nNum)
            aADD(aVet , nNum) //Insere os valores digitados na array.

            cNum += ('  ' + Alltrim(STR(aVet[nCont]))) //Insere os valores da array na string cNum.
    next

    FwAlertSuccess('Os valores digitados foram: ' + cNum) //Mostra para o usu�rio a string cNum com os valores da array.

Return
