#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
    Desenvolva um programa que criará um diretório chamado “Lista 13 – Ex1” na pasta temporária do Windows.
    @type  Function
    @author Tamíris Cordeiro
    @since 24/04/2023
    /*/
User Function Ex1L13()
   local cCaminho := GetTempPath()
   local cNomePasta :=  'Lista 13 - Ex1\'
 
    if !ExistDir(cCaminho + cNomePasta) //verifica se existe uma pasta
        if MakeDir(cCaminho + cNomePasta) == 0
            if ExistBlock('Ex2L13')
                ExecBlock('Ex2L13', .F., .F., cCaminho + cNomePasta)
            endif
        else
            FwAlertError('Houve um erro ao criar a pasta!', 'Erro!')
        endif
    endif
Return


