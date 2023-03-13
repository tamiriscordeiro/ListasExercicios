// 6 � No Cadastro de Fornecedores, utilizando um
// Ponto de Entrada, ao tentar incluir ou alterar um
// cadastro, fa�a as seguintes valida��es:
// - Se o campo �Pa�s� estiver em branco n�o
// poder� realizar a inclus�o / altera��o.
// - Se o pa�s for �Brasil� (105), o campo �CNPJ�
// dever� ser preenchido, caso n�o seja, n�o
// poder� realizar a inclus�o / altera��o.
// - Se o pa�s n�o for �Brasil�, o CNPJ n�o �
// obrigat�rio.

// 7 � Desenvolva uma rotina para que ao incluir um
// novo Cadastro de Fornecedor, o campo �LOJA�
// seja preenchido automaticamente antes da
// abertura da tela de cadastro, ou seja, quando a
// tela carregar, o campo LOJA j� estar� preenchido.
// O n�mero da loja dever� ser gerado
// automaticamente e estar entre 01 e 09

// 9 � Implemente uma valida��o na exclus�o de
// Cadastros de Fornecedores. O sistema dever�
// perguntar se o usu�rio confirma a exclus�o do
// cadastro, se ele confirmar, o cadastro dever� ser
// exclu�do, caso contr�rio, dever� permanecer na
// tela de exclus�o.

// 10 � Acrescente um bot�o � rotina de Cadastros de
// Fornecedores, para que seja poss�vel acessar os
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
                FwAlertInfo("Voc� est� prestes a alterar o cadastro do fornecedor " + SA2->A2_NOME, 'Alterar')
            ELSE
                FwAlertInfo("Voc� est� prestes a excluir o cadastro do fornecedor " + SA2->A2_NOME, 'Excluir')
            endif

        Elseif cIdPonto == "MODELPOS"
            IF Vazio(M->A2_PAIS)
                Help(NIL, NIL, "Pa�s n�o informado", NIL, "Campo pa�s em branco", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha o campo pa�s."})
                xRet := .F.
                
            elseif (M->A2_PAIS == "105") .and. Vazio(M->A2_CGC)
                Help(NIL, NIL, "CNPJ inv�lido", NIL, "Campo CNPJ inv�lido", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha o campo com um CNPJ v�lido."})
                xRet := .F.

            Elseif ALTERA == .F. .AND. INCLUI == .F.
                xRet := ApMsgYesNo("Confirma a exclus�o do cadastro?" + " Continua?")
            Endif

        ElseIf cIdPonto == "BUTTONBAR"
            xRet := {{"Cad. Produto", "NOVO", {||U_BotCadPro()}}}
            oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", cNum)
            oView := FwViewActive()
            oView:Refresh()
            
        Endif
    Endif
Return xRet
