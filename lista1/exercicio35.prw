#INCLUDE "TOTVS.CH"

//  - Fa�a um programa que receba v�rias idades e que calcule e mostre a m�dia das idades digitadas.
// Finalize o processo de entrada de dados digitando a idade igual a zero

User Function IdadeMedia()
    Local nIdade := -1
    Local nMedia := 0
    Local nSoma  := 0
    Local nI     := 0

    While nIdade <> 0
        nIdade := Val(FwInputBox('Digite aqui a idade da pessoa, ou coloque 0 para finalizar e calcular a m�dia')) 
        
        If nIdade <> 0
            nSoma += nIdade
            nI++
        Endif

    ENDDO
    nMedia := nSoma / nI

    FwAlertSuccess('A m�dia da idade das pessoas �: ' + cValToChar(nMedia))
return
