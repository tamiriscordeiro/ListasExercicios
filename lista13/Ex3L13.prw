#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Ex3L13
    Desenvolva um programa para ler o texto do arquivo criado no exercício anterior e
    apresentá-lo em uma mensagem para o usuário.
    @type  Function
    @author Tamíris Cordeiro
    @since 24/04/2023
    /*/
User Function Ex3L13()
    local cPasta    := 'C:\Users\irisc\AppData\Local\Temp'
    local cArquivo  := 'Exercicio2.txt'
    local cTxtLinha := ''
    local oArq      := FwFileReader():New(cPasta + cArquivo)

    if oArq:Open()
        if !oArq:EOF() 
            while oArq:HasLine() 
                cTxtLinha += oArq:GetLine(.T.) 
            enddo
        endif
        oArq:Close()
    endif

    FwAlertInfo(cTxtLinha, 'Conteúdo do Arquivo:')
Return


