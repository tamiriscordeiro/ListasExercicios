#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Ex4L13
    Escreva um programa que criarÃ¡ uma pasta com o nome â€œLista 13â€ no rootpath
    (protheus_data) e copiarÃ¡ o arquivo do exercÃ­cio 2 para essa pasta.
    @type  Function
    @author Tamíris Cordeiro
    @since 24/04/2023
    /*/
User Function Ex4L13()

    Cria()

    Copia()

Return

Static Function Cria()
    local cCaminho   := '\'
    local cNomePasta :=  'Lista 13\'
 
    if !ExistDir(cCaminho + cNomePasta)
        if MakeDir(cCaminho + cNomePasta) == 0
            FwAlertSuccess('Pasta criada com sucesso!', 'Sucesso!')
        else
            FwAlertError('Houve um erro ao criar a pasta!', 'Erro!')
        endif
    endif
Return

Static Function Copia()
    local cPastaOri  := 'C:\Users\irisc\AppData\Local\Temp\Lista 13 - Ex1\'
    local cPastaDest := '\Lista 13\'
    local aArquivos  := Directory(cPastaOri + '*.*', 'D', , , 1)
    local nI         := 0
    local nTamanho   := LEN(aArquivos)

    if nTamanho > 0
        for nI := 3 to nTamanho
            if !CPYT2S(cPastaOri + aArquivos[nI][1], cPastaDest)
                MsgStop('Houve um erro ao copiar o arquivo!' + aArquivos[nI][1])
            endif
        next
        
        FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluído!')
    else
        FwAlertInfo('A pasta não contém nenhum arquivo ou subpasta!', 'Atenção!')
    endif

Return


