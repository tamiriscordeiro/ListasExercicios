// 16 � Crie uma fun��o que permita ao usu�rio digitar o seu nome e em seguida mostre-o de tr�s para
// frente utilizando apenas letras mai�sculas.
// � Exemplo:
// o Usu�rio digita o nome �Maria�
// o Dever� ser apresentado: �AIRAM�

#INCLUDE "TOTVS.CH"

User Function InverteUpp()
    local cNome     := ""
    local cInverte  := ""
    local nCont     := 0

        cNome := (FwInputBox('Digite seu nome: ' , cNome)) //Pede o nome para o usu�rio.
            cNome := (UPPER(cNome)) //Coloca o nome em maiusculo.

    for nCont := len(cNome) to 1 Step -1 //Percorre a string e inverte
        cInverte += SUBSTR(cNome, nCont,1) 
    next

    FwAlertSuccess('Seu nome invertido � : ' + cInverte) //Mostra o nome invertido.

Return
