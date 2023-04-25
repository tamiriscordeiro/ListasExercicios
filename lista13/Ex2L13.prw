#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Ex2L13
    Escreva um programa para criar um arquivo TXT com um texto qualquer e salvar dentro da pasta criada no exercício anterior.
    @type  Function
    @author Tamíris Cordeiro
    @since 24/04/2023
    /*/
User Function Ex2L13()
    local cPasta := PARAMIXB
    local cArquivo := 'Exercicio2.txt'
    local oWriter := FwFileWriter():New(cPasta + cArquivo, .T.)

    if File(cPasta + cArquivo)
        FwAlertInfo('O arquivo já existe!', 'Atenção!')
    else
        if !oWriter:Create()
            FwAlertError('Houve um erro ao gerar o arquivo!' + CRLF + 'Erro:' + oWriter:Error():Message, 'Erro!')
        else
            oWriter:Write('Olá' + CRLF + 'Esse é o arquivo txt do exercício 2 da lista 13.')
            oWriter:Close()

            if MsgYesNo('Arquivo gerado com sucesso! (' + cPasta + cArquivo + ')' + CRLF + 'Deseja abrir o arquivo?', 'Abrir?')
                ShellExecute('OPEN', cArquivo, '', cPasta, 1)
            endif
        endif
    endif  
Return


