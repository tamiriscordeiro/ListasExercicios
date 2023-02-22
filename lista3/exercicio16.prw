// 16 – Crie uma função que permita ao usuário digitar o seu nome e em seguida mostre-o de trás para
// frente utilizando apenas letras maiúsculas.
// • Exemplo:
// o Usuário digita o nome “Maria”
// o Deverá ser apresentado: “AIRAM”

#INCLUDE "TOTVS.CH"

User Function InverteUpp()
    local cNome     := ""
    local cInverte  := ""
    local nCont     := 0

        cNome := (FwInputBox('Digite seu nome: ' , cNome)) //Pede o nome para o usuário.
            cNome := (UPPER(cNome)) //Coloca o nome em maiusculo.

    for nCont := len(cNome) to 1 Step -1 //Percorre a string e inverte
        cInverte += SUBSTR(cNome, nCont,1) 
    next

    FwAlertSuccess('Seu nome invertido é : ' + cInverte) //Mostra o nome invertido.

Return
