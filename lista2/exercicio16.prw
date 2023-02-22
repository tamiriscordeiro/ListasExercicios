// 16 - Fazer um programa que simule um cadastro de usu�rio e senha para um sistema qualquer.
// O usu�rio informar� um �username� e uma senha que dever� ser digitada duas vezes (confirma��o de senha).
// Realizar as seguintes consist�ncias:
// o O �username� deve possuir mais do que 5 caracteres.
// o A senha e a confirma��o da senha devem ser id�nticas.
// o A senha deve possuir ao menos 6 caracteres e deve conter obrigatoriamente:
//  Ao menos uma letra mai�scula, um d�gito num�rico e um s�mbolo.

#INCLUDE "TOTVS.CH"

User Function CadUserSenha()
    Local cUsuario := ''
    Local cSenha1  := ''
    Local cSenha2  := ''
    
    WHILE .T.
        cUsuario := FwInputBox('insira aqui o nome de usu�rio')

        //Aqui o usu�rio � obrigado a fazer um nome de usu�rio com mais de 5 caracteres
        IF len(cUsuario) < 6
            FwAlertError('Seu usuario deve possuir mais do que 5 caracteres')
        ELSE
            EXIT//Optei por EXIT para n�o ficar resetando toda hora o Loop, gastando 1 linha por vez
        ENDIF
    ENDDO

    WHILE .T. 
        cSenha1 := FwInputBox('Insira aqui sua senha')

        //Aqui o usu�rio � obrigado a fazer uma senha com mais de 5 caracteres
        IF len(cSenha1) < 6
            FwAlertError('Sua senha deve possuir mais do que 5 caracteres')

        //Aqui � chamado a fun��o TesteSenha que explicarei mais abaixo
        ELSEIF !TesteSenha(cSenha1)

           FwAlertError('Sua senha deve possuir ao menos uma letra maiuscula, um digito numerico e um simbolo')
        ELSE
            EXIT
        ENDIF
    ENDDO

    //Loop que obriga o usu�rio a confirmar a senha e caso n�o seja exatamente igual a primeira, ele n�o sai do loop.
    WHILE .T.
        cSenha2 := FwInputBox('Confirme sua senha', 'Cadastro')
        IF cSenha1 == cSenha2
            EXIT
        ELSE
            FwAlertError('Suas senhas nao coincidem')
        ENDIF
    ENDDO

    FwAlertSuccess('Usuario e Senha cadastrados')


Return

//Nesta fun��o, a senha do usu�rio ser� percorrida 3x por 3 loops For, cada uma checando cada elemento da string para conferir se a senha apresenta pelo menos uma letra mai�scula, um n�mero e um s�mbolo.
static Function TesteSenha(cSenha)
    Local nI    := 0
    Local lLet  := .F.
    Local lDigi := .F.
    Local lSimb := .F.
    
    FOR nI := 1 TO len(cSenha)
        IF isUpper(SubStr(cSenha, nI , 1))
            lLet := .T.
            EXIT
        ENDIF
    NEXT nI
    
    for nI := 1 to len(cSenha)
        IF IsDigit(SubStr(cSenha, nI , 1))
            lDigi := .T.
            EXIT
        ENDIF
    NEXT nI
    
    //Para s�mbolos foi utilizada a tabela ASC 
    for nI := 1 to len(cSenha)
        IF (asc(SubStr(cSenha, nI, 1)) >= 33 .and. asc(SubStr(cSenha, nI, 1)) <= 47) .or.(asc(SubStr(cSenha, nI, 1)) >=58 .and. asc(SubStr(cSenha, nI, 1)) <=64) .or. (asc(SubStr(cSenha, nI, 1)) >= 91 .and. asc(SubStr(cSenha, nI, 1)) <= 96) .or. (asc(SubStr(cSenha, nI, 1)) >= 123 .and. asc(SubStr(cSenha, nI, 1)) <= 126)
            lSimb := .T.
            EXIT
        ENDIF
    NEXT nI

    IF lLet .AND. lDigi .AND. lSimb
        RETURN .T.
    ENDIF
RETURN .F.
