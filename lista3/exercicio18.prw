// 18 – Desenvolva uma função que solicite o nome do usuário e mostre-o na vertical em escada.
// Exemplo:
// M
// MA
// MAR
// MARI
// MARIA

#INCLUDE "TOTVS.CH"

User Function FazEscada()
    local cNome     := ""
    local cAlinha   := ""
    local nCont     := 0

        cNome := (FwInputBox('Digite seu nome: ' , cNome)) //Pede o nome para o usuário.
            cNome := (UPPER(cNome)) //Coloca o nome em maiusculo.

    for nCont := 1 to len(cNome) //Percorre a string e salva em outra no formato alinhado na vertical.
        cAlinha += (SUBSTR(cNome, 1 , nCont) + CRLF ) 
    next

    FwAlertSuccess('Seu nome : ' + CRLF + cAlinha) //Mostra o nome alinhado na vertical

Return
