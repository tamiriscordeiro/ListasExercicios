// 8 - Fa�a um algoritmo para ler um nome de usu�rio (user name) e uma senha. Caso correspondam aos
// dados armazenados internamente no programa atrav�s do uso de constantes (�chumbado� / hard
// coded), deve ser apresentada a mensagem �Acesso permitido�. Caso o usu�rio/senha n�o
// coincidam, exibir a mensagem �Usu�rio ou senha inv�lido�. A verifica��o da senha s� dever�
// ocorrer caso o usu�rio coincida, por�m o usu�rio n�o deve saber especificamente se foi o nome de
// usu�rio ou a senha que n�o coincidiu.

#INCLUDE "TOTVS.CH"
#DEFINE S 54321

User Function ChecaUsuario()
    local cUsuario  := ''
    local cUser     := 'USUARIO'
    local nSenha    := 0

    cUsuario := FwInputBox('Usu�rio: ' , cUsuario)

    nSenha := FwInputBox('Senha: ')
        nSenha:= val(nSenha)

    if (cUsuario <> cUser)
        FwAlertError('Usu�rio ou Senha Inv�lidos')
    elseif (cUsuario = cUser)
        if (nSenha <> S)
            FwAlertError('Usu�rio ou Senha Inv�lidos')
        else
            FwAlertSuccess('Acesso Permitido!')
        endif 
    endif 
    
Return

