#INCLUDE "TOTVS.CH"

// - Faça um algoritmo que calcule e escreva a média aritmética dos números inteiros 
// entre 15 (inclusive) e 100 (inclusive).

User Function Media15()

    local nNum   := 15
    local nSoma  := 0
    local nCont  := 0
    local nMedia := 0

        while nNum <= 100

            nSoma := nSoma + nNum
            nNum++
            nCont++

        enddo 

        nMedia := nSoma / nCont        

        FwAlertSuccess('A média dos valores entre 15 e 100 é ' + cValToChar(nMedia))

Return 
