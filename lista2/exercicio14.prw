// 14 - Faça um programa que calcule a somatória dos "n" primeiros números naturais pares ou ímpares.
// O usuário informará através de digitação a quantidade de números desejada ("n") e escolherá
// entre par ou ímpar.

#INCLUDE "TOTVS.CH"

User Function SomaParImpar()
    Local nCont := 0
    Local nNum := 0
    Local aTipo := {'Impares', 'Pares'}
    Local nTipo := 0
    Local nSoma := 0
    
    nNum := val(FwInputBox('Digite a quantidade de números desejada:'))

    nTipo := Aviso('Escolha o tipo de número:', 'Faça sua escolha', aTipo, 1)

    if nTipo == 1
        for nCont := 1 to nNum step 2 //Soma dos números ímpares
            nSoma += nCont
        next
    else
        for nCont := 2 to nNum  step 2//Soma dos números pares
            nSoma += nCont
        next
    endif

    FwAlertSuccess('A soma dos ' + cValToChar(nNum) + ' primeiros números ' + aTipo[nTipo] + ' é: ' + cValToChar(nSoma))

return
