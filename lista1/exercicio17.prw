#INCLUDE "TOTVS.CH"

User Function CalcMedia()
//- Acrescente uma mensagem 'NOVO C�LCULO (S/N)?' ao final do exerc�cio anterior. 
// Se for respondido 'S' deve retornar e executar um novo c�lculo, caso contr�rio dever� encerrar o algoritmo.

    local nAva1    := 0
    local nAva2    := 0
    local nMedia   := 0
    local cChoice  := "S"

        while cChoice == 'S'
        
            nAva1 := FwInputBox('Digite a nota da primeira avalia��o: ')
                nAva1 := val(nAva1)

            while (nAva1 < 0) .OR. (nAva1 > 10)
                FwAlertError('NOTA INV�LIDA.')
                nAva1 := FwInputBox('Digite a nota da primeira avalia��o: ')
                    nAva1 := val(nAva1)
            enddo 
    
            nAva2 := FwInputBox('Digite a nota da segunda avalia��o: ')
                nAva2 := val(nAva2)

            while (nAva2 < 0) .OR. (nAva2 > 10)
                FwAlertError('NOTA INV�LIDA')
                nAva2 := FwInputBox('Digite a nota da segunda avalia��o: ')
                    nAva2 := val(nAva2)
            enddo 

            nMedia := (nAva1 + nAva2) / 2

            FwAlertInfo('A m�dia entre essas avalia��es � ' + cValToChar(nMedia))

            cChoice := FwInputBox('NOVO C�LCULO (S/N)? ' , cChoice)

        enddo 

        FwAlertInfo('Medias Calculadas com Sucesso! ')
Return 
