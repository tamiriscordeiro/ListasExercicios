#INCLUDE 'TOTVS.CH'

User Function Ex5L13()
    local cPasta    := 'C:\Users\irisc\AppData\Local\Temp\Lista 13 - Ex1\'
    local aArquivos := Directory(cPasta + '*.*', 'D', , , 1)
    local nI        := 0

    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclusão da pasta?', 'Atenção!')
            if LEN(aArquivos) > 0
                for nI := 1 to LEN(aArquivos)
                   if FErase(cPasta + aArquivos[nI][1]) == -1
                        MsgStop('Houve um erro ao apagar o arquivo ' + aArquivos[nI][1])
                   endif
                next
            endif

            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso!', 'Concluído')
            else
                FwAlertError('Houve um erro ao excluir a pasta', 'Erro!')
            endif
        endif
    endif
Return
