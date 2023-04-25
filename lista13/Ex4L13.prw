#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Ex4L13
    Escreva um programa que criará uma pasta com o nome “Lista 13” no rootpath
    (protheus_data) e copiará o arquivo do exercício 2 para essa pasta.
    @type  Function
    @author Tam�ris Cordeiro
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
        
        FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Conclu�do!')
    else
        FwAlertInfo('A pasta n�o cont�m nenhum arquivo ou subpasta!', 'Aten��o!')
    endif

Return


