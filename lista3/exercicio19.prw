// 19 - Solicite ao usuário que escreva uma frase, após isso conte:
// o Quantos espaços em branco existem na frase
// o Quantas vezes cada vogal aparece na frase.
//  Ex: A: 5, E: 2, I: 2, O: 1, U: 0

#INCLUDE "TOTVS.CH"

User Function QuantasTem()
    local aVogais   := {{'A', 0} , {'E', 0} , {'I', 0} , {'O', 0} , {'U', 0} , {'SPACE', 0}}
    local cFrase    := ""
    local nCont     := 0

        cFrase := (FwInputBox('Digite uma frase: ' , cFrase)) //Pede uma frase para o usuário.
            cFrase := (UPPER(cFrase)) //Coloca a frase em maiusculo.

    for nCont := 1 to len(cFrase) //Percorre a string e procura as informações das letras e espaços.
        if (SUBSTR(cFrase, nCont , 1)) == 'A'
            aVogais[1,2]++
        elseif (SUBSTR(cFrase, nCont , 1)) == 'E'
            aVogais[2,2]++
        elseif (SUBSTR(cFrase, nCont , 1)) == 'I'
            aVogais[3,2]++
        elseif (SUBSTR(cFrase, nCont , 1)) == 'O'
            aVogais[4,2]++
        elseif (SUBSTR(cFrase, nCont , 1)) == 'U'
            aVogais[5,2]++
        elseif (SUBSTR(cFrase, nCont , 1)) == ' '
            aVogais[6,2]++   
        endif
    next

    FwAlertSuccess('A vogal "A" aparece ' + cValToChar(aVogais[1,2]) + ' vezes' + CRLF +; // Mostra os dados da frase.
    'A vogal "E" aparece ' + cValToChar(aVogais[2,2]) + ' vezes' + CRLF +;
    'A vogal "I" aparece ' + cValToChar(aVogais[3,2]) + ' vezes' + CRLF +;
    'A vogal "O" aparece ' + cValToChar(aVogais[4,2]) + ' vezes' + CRLF +;
    'A vogal "U" aparece ' + cValToChar(aVogais[5,2]) + ' vezes' + CRLF +;
    'existem ' + cValToChar(aVogais[6,2]) + ' espaços em brancos na frase: ' + CRLF + cFrase)

Return
