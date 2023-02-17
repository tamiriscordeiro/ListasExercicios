// 14 - Fa�a um programa que calcule a somat�ria dos "n" primeiros n�meros naturais pares ou �mpares.
// O usu�rio informar� atrav�s de digita��o a quantidade de n�meros desejada ("n") e escolher�
// entre par ou �mpar.

#INCLUDE "TOTVS.CH"

User Function SomaParImpar()
    Local nCont := 0
    Local nNum := 0
    Local aTipo := {'Impares', 'Pares'}
    Local nTipo := 0
    Local nSoma := 0
    
    nNum := val(FwInputBox('Digite a quantidade de n�meros desejada:'))

    nTipo := Aviso('Escolha o tipo de n�mero:', 'Fa�a sua escolha', aTipo, 1)

    if nTipo == 1
        for nCont := 1 to nNum step 2 //Soma dos n�meros �mpares
            nSoma += nCont
        next
    else
        for nCont := 2 to nNum  step 2//Soma dos n�meros pares
            nSoma += nCont
        next
    endif

    FwAlertSuccess('A soma dos ' + cValToChar(nNum) + ' primeiros n�meros ' + aTipo[nTipo] + ' �: ' + cValToChar(nSoma))

return
