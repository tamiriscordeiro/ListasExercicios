// Parte 1: Elaborar um jogo do tipo adivinhe o n�mero. Onde dever� ser sorteado um n�mero
// entre 0 e 100. Em seguida solicitado que o usu�rio adivinhe qual foi o n�mero sorteado.
// Ap�s o �chute� do usu�rio apresentar uma mensagem informando se o n�mero sorteado � maior, menor ou
// igual ao n�mero �chutado�.

#INCLUDE 'TOTVS.CH'

User Function Kichute()
    Local nSort   := 0
    Local nChute  := 0
    Local lLoop   := .T.
    Local lOpcao  := 0

    FwAlertInfo('Vamos jogar um jogo de adivinha��o?')


    nSort := RANDOMIZE(0, 100)

    nChute := Val(FwInputBox('Coloque aqui um n�mero para ser seu chute.'))

    While lLoop 
        If nSort > nChute
            MSGALERT('O n�mero sorteado � maior que seu chute', 'Maior')

        Elseif nSort < nChute
            MSGALERT('O n�mero sorteado � menor que seu chute', 'Menor')

        Else
            FwAlertSuccess('Parab�ns, voc� acertou o n�mero sorteado!')
            Exit
        Endif

        lOpcao := MSGYESNO('Deseja tentar novamente?', 'N�o foi dessa vez')

        If lOpcao == .F.
            FwAlertInfo('Que pena que voc� desistiu' + CRLF +;
            'O n�mero sorteado era: ' + cValToChar(nSort), 'QUE PENA')
            Exit
        Endif

        nChute := Val(FwInputBox('Coloque aqui um n�mero para ser seu chute.'))
    End

Return
