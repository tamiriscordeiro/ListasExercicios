#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Ch2L13
    Criando uma pasta para os pdfs de pedidos de vendas do protheus e copiando os arquivos para ela.
    @type  Function
    @author Tam�ris Cordeiro
    @since 25/04/2023
    /*/
User Function Ch2L13()
    Criapasta()

    CopiaArq()
Return 

Static Function CriaPasta()
    Local cCaminho   := 'C:\'
    Local cNomePasta := 'Vendas Protheus'
    Local cDelPasta  := ''

    if !ExistDir(cCaminho + cNomePasta) 
        if MakeDir(cCaminho + cNomePasta) == 0 
            FwAlertSuccess('Pasta Criada com sucesso!', 'Conclu�do!')
        else
            FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
        endif
    else
        if MsgYesNo('J� existe uma pasta neste local com o nome ' + cNomePasta + ', deseja sobrep�-la?')
            cDelPasta := cCaminho + cNomePasta

            DelPasta(cDelPasta)

                if MakeDir(cCaminho + cNomePasta) == 0
                    FwAlertSuccess('Pasta Criada com sucesso!', 'Conclu�do!')
                else
                    FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
                endif
        endif
    endif
Return

Static Function DelPasta(cPasta)
    Local aArquivos := Directory(cPasta + '.', 'D', , , 1)
    Local nI        := 0
    Local nTamanho  := Len(aArquivos)
    
    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclus�o da pasta anterior?', 'Aten��o!')
            if nTamanho > 0
                for nI := 3 to nTamanho
                   if FErase(cPasta + aArquivos[nI][1]) == -1
                        MsgStop('Houve um erro ao apagar o arquivo ' + aArquivos[nI][1])
                   endif
                next
            endif

            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso!', 'Conclu�do')
            else
                FwAlertError('Houve um erro ao excluir a pasta anterior', 'Erro!')
            endif
        endif
    endif
Return


Static Function CopiaArq()
    Local cPastaOri  := 'C:\totvs12\Protheus\protheus_data\Pedidos de Venda\'
    Local cPastaDest := 'C:\totvs12\Protheus\protheus_data\Vendas Protheus\'
    Local aArquivos  := Directory(cPastaOri + '.pdf', 'D', , , 1)
    Local nI         := 0
    Local nTamanho   := LEN(aArquivos)

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
