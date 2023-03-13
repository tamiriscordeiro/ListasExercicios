// 6 – No Cadastro de Fornecedores, utilizando um
// Ponto de Entrada, ao tentar incluir ou alterar um
// cadastro, faça as seguintes validações:
// - Se o campo “País” estiver em branco não
// poderá realizar a inclusão / alteração.
// - Se o país for “Brasil” (105), o campo “CNPJ”
// deverá ser preenchido, caso não seja, não
// poderá realizar a inclusão / alteração.
// - Se o país não for “Brasil”, o CNPJ não é
// obrigatório.

// 7 – Desenvolva uma rotina para que ao incluir um
// novo Cadastro de Fornecedor, o campo “LOJA”
// seja preenchido automaticamente antes da
// abertura da tela de cadastro, ou seja, quando a
// tela carregar, o campo LOJA já estará preenchido.
// O número da loja deverá ser gerado
// automaticamente e estar entre 01 e 09

// 9 – Implemente uma validação na exclusão de
// Cadastros de Fornecedores. O sistema deverá
// perguntar se o usuário confirma a exclusão do
// cadastro, se ele confirmar, o cadastro deverá ser
// excluído, caso contrário, deverá permanecer na
// tela de exclusão.

// 10 – Acrescente um botão à rotina de Cadastros de
// Fornecedores, para que seja possível acessar os
// Cadastros de Produtos.

#INCLUDE 'TOTVS.CH'

User Function CUSTOMERVENDOR()
    Local aParam := PARAMIXB
    Local xRet := .T.
    Local oObj := ""
    Local cIdPonto := ""
    Local cIdModel := ""
    Local lIsGrid := .F.
    Local cNum

    cNum := StrZero(Randomize(1, 10), 2)

    If aParam <> NIL
        oObj := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]
        lIsGrid := (Len(aParam) > 3)

        If cIdPonto == "MODELVLDACTIVE"
            if INCLUI
                FwAlertInfo("Seja Bem vindo(a) ao Cadastro de Fornecedores!", "Bem vindo!")

            ELSEIF ALTERA 
                FwAlertInfo("Você está prestes a alterar o cadastro do fornecedor " + SA2->A2_NOME, 'Alterar')
            ELSE
                FwAlertInfo("Você está prestes a excluir o cadastro do fornecedor " + SA2->A2_NOME, 'Excluir')
            endif

        Elseif cIdPonto == "MODELPOS"
            IF Vazio(M->A2_PAIS)
                Help(NIL, NIL, "País não informado", NIL, "Campo país em branco", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha o campo país."})
                xRet := .F.
                
            elseif (M->A2_PAIS == "105") .and. Vazio(M->A2_CGC)
                Help(NIL, NIL, "CNPJ inválido", NIL, "Campo CNPJ inválido", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha o campo com um CNPJ válido."})
                xRet := .F.

            Elseif ALTERA == .F. .AND. INCLUI == .F.
                xRet := ApMsgYesNo("Confirma a exclusão do cadastro?" + " Continua?")
            Endif

        ElseIf cIdPonto == "BUTTONBAR"
            xRet := {{"Cad. Produto", "NOVO", {||U_BotCadPro()}}}
            oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", cNum)
            oView := FwViewActive()
            oView:Refresh()
            
        Endif
    Endif
Return xRet
