// 7 – Fazer um programa que simule um cadastro de usuário e senha para um sistema qualquer.
// O usuário informará um “username” e uma senha que deverá ser digitada duas vezes (confirmação de senha).
// Realizar as seguintes consistências:
// o O “username” deve possuir mais do que 5 caracteres.
// o A senha e a confirmação da senha devem ser idênticas.
// o A senha deve possuir ao menos 6 caracteres e deve conter obrigatoriamente:
// ? Ao menos uma letra maiúscula, um dígito numérico e um símbolo.

#INCLUDE "TOTVS.CH"

User Function Ex7L4()

    local cUser     := space(30)
    local cSenha1   := space(30)
    local cSenha2   := space(30)
    Private oDlg 


    DEFINE MSDIALOG oDlg TITLE "Login" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite o seu usarname: " SIZE 80, 14 OF oDlg Pixel
    @ 017, 090 MSGET cUser                  SIZE 60, 11 OF oDlg PIXEL 

    @ 040, 010 SAY "Digite a sua senha: "    SIZE 80, 14 OF oDlg Pixel
    @ 037, 090 MSGET cSenha1                  SIZE 60, 11 OF oDlg PIXEL PASSWORD

    @ 060, 010 SAY "Confirme a senha: "      SIZE 80, 14 OF oDlg Pixel
    @ 057, 090 MSGET cSenha2                  SIZE 60, 11 OF oDlg PIXEL PASSWORD

    @ 090, 025 BUTTON "Realizar Cadastro!"   SIZE 120, 11 OF oDlg Pixel;
    ACTION (Confirm(Alltrim(cUser), Alltrim(cSenha1), Alltrim(cSenha2)))


    ACTIVATE MSDIALOG oDlg CENTERED

Return 

Static Function Confirm(cUser, cSenha1, cSenha2)

    local nI    := 0 
    local lDigt := .F.
    local lNum  := .F.
    local lUp   := .F.

    if  LEN(cUser) < 5 
        FWAlertError("Username deve ter mais de 5 caracteres.")
    endif

    if len(cSenha1) < 6  
        FwAlertInfo("Senha inválida!" +CRLF+CRLF+ "A senha deve conter 6 ou mais caracteres.")
    ENDIF

    FOR nI := 1 TO len(cSenha1)
    IF isUpper(SubStr(cSenha1, nI , 1))
        lUp := .T.
        EXIT
    ENDIF
    NEXT nI

    for nI := 1 to len(cSenha1)
    IF IsDigit(SubStr(cSenha1, nI , 1))
        lNum := .T.
        EXIT 
    ENDIF
    NEXT nI

    for nI := 1 to len(cSenha1)
    IF (asc(SubStr(cSenha1, nI, 1)) >= 33 .and. asc(SubStr(cSenha1, nI, 1)) <= 47) .or.(asc(SubStr(cSenha1, nI, 1)) >=58 .and. asc(SubStr(cSenha1, nI, 1)) <=64) .or. (asc(SubStr(cSenha1, nI, 1)) >= 91 .and. asc(SubStr(cSenha1, nI, 1)) <= 96) .or. (asc(SubStr(cSenha1, nI, 1)) >= 123 .and. asc(SubStr(cSenha1, nI, 1)) <= 126)
        lDigt := .T.
        EXIT  
    ENDIF
    NEXT nI

    IF lUp .AND. lNum .AND. lDigt
        // Compara a senha
        if cSenha2 == cSenha1
            FwAlertSuccess("Usuario cadastrado!")
            oDlg:END()
        else
            FWAlertError("As senhas não coincidem.") 
        ENDIF

    else
        FWAlertError("A senha deve possuir pelo menos uma letra maiúscula, um numero e um simbolo")      
    ENDIF

RETURN
