#INCLUDE "TOTVS.CH"

// - Escreva um algoritmo que permita a leitura dos nomes de 10 pessoas e armazene os nomes
// lidos em um array. Após isto, o algoritmo deve permitir a leitura de mais 1 nome qualquer de
// pessoa e depois escrever a mensagem ACHEI, se o nome estiver entre os 10 nomes lidos
// anteriormente (guardados no array), ou NÃO ACHEI caso contrário.

User Function EncontreNomes()

    local aNomes := {}
    local cNome  := ""
    local cFind  := ""
    local nCont  := 0

        while nCont < 10

            cNome := FwInputBox('Digite um nome : ' , cNome)
                aADD(aNomes, cNome)
            cNome := ""

            nCont++
        enddo 

        cFind := FwInputBox('Digite um nome que queira encontrar na lista : ' , cFind)

        if AScan(aNomes,cFind) != 0
            FwAlertSuccess('ACHEI')

            else
                FwAlertError('NÃO ACHEI')
        endif 
Return 
