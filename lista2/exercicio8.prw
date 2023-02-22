// 8 - Faça um algoritmo para ler um nome de usuário (user name) e uma senha. Caso correspondam aos
// dados armazenados internamente no programa através do uso de constantes (“chumbado” / hard
// coded), deve ser apresentada a mensagem “Acesso permitido”. Caso o usuário/senha não
// coincidam, exibir a mensagem “Usuário ou senha inválido”. A verificação da senha só deverá
// ocorrer caso o usuário coincida, porém o usuário não deve saber especificamente se foi o nome de
// usuário ou a senha que não coincidiu.

#INCLUDE "TOTVS.CH"
#DEFINE S 54321

User Function ChecaUsuario()
    local cUsuario  := ''
    local cUser     := 'USUARIO'
    local nSenha    := 0

    cUsuario := FwInputBox('Usuário: ' , cUsuario)

    nSenha := FwInputBox('Senha: ')
        nSenha:= val(nSenha)

    if (cUsuario <> cUser)
        FwAlertError('Usuário ou Senha Inválidos')
    elseif (cUsuario = cUser)
        if (nSenha <> S)
            FwAlertError('Usuário ou Senha Inválidos')
        else
            FwAlertSuccess('Acesso Permitido!')
        endif 
    endif 
    
Return

