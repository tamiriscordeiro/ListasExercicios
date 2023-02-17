// Parte 1: Elaborar um jogo do tipo adivinhe o número. Onde deverá ser sorteado um número
// entre 0 e 100. Em seguida solicitado que o usuário adivinhe qual foi o número sorteado.
// Após o “chute” do usuário apresentar uma mensagem informando se o número sorteado é maior, menor ou
// igual ao número “chutado”.

#INCLUDE 'TOTVS.CH'

User Function Kichute()
    Local nSort   := 0
    Local nChute  := 0
    Local lLoop   := .T.
    Local lOpcao  := 0

    FwAlertInfo('Vamos jogar um jogo de adivinhação?')


    nSort := RANDOMIZE(0, 100)

    nChute := Val(FwInputBox('Coloque aqui um número para ser seu chute.'))

    While lLoop 
        If nSort > nChute
            MSGALERT('O número sorteado é maior que seu chute', 'Maior')

        Elseif nSort < nChute
            MSGALERT('O número sorteado é menor que seu chute', 'Menor')

        Else
            FwAlertSuccess('Parabéns, você acertou o número sorteado!')
            Exit
        Endif

        lOpcao := MSGYESNO('Deseja tentar novamente?', 'Não foi dessa vez')

        If lOpcao == .F.
            FwAlertInfo('Que pena que você desistiu' + CRLF +;
            'O número sorteado era: ' + cValToChar(nSort), 'QUE PENA')
            Exit
        Endif

        nChute := Val(FwInputBox('Coloque aqui um número para ser seu chute.'))
    End

Return
