// 6 – Faça um algoritmo para ler um nome de usuário
// (user name) e uma senha. Caso correspondam aos
// dados armazenados internamente no programa
// através do uso de constantes (hard coded), deve
// ser apresentada a mensagem “Acesso permitido”.
// Caso o usuário/senha não coincidam, exibir a
// mensagem “Usuário ou senha inválido”. A
// verificação da senha só deverá ocorrer caso o
// usuário coincida, porém o usuário não deve saber
// especificamente se foi o nome de usuário ou a
// senha que não coincidiu.


#INCLUDE 'TOTVS.CH'
#DEFINE Usuario 'User'
#DEFINE Senha 'senha123'

User Function Ex6L4()
    Local oGrpLog
    Local oBtnConf
    Local nJanLarg := 200
    Local nJanAltu := 200
    Private lRetorno := .F.
    Private oDlgPvt
    //Says e Gets
    Private oSayUsr
    Private oGetUsr, cGetUsr := Space(25)
    Private oSayPsw
    Private oGetPsw, cGetPsw := Space(20)
    Private oGetErr, cGetErr := ""
    //Dimensões da janela

      
    //Criando a janela
    DEFINE MSDIALOG oDlgPvt TITLE "Login" FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
        //Grupo de Login
        @ 003, 001     GROUP oGrpLog TO (nJanAltu/2)-1, (nJanLarg/2)-3         PROMPT "Login: "     OF oDlgPvt COLOR 0, 16777215 PIXEL
            //Label e Get de Usuário
            @ 013, 006   SAY   oSayUsr PROMPT "Usuários:"       SIZE 030, 007 OF oDlgPvt                    PIXEL
            @ 020, 006   MSGET oGetUsr VAR    cGetUsr           SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 PIXEL
          
            //Label e Get da Senha
            @ 033, 006   SAY   oSayPsw PROMPT "Senha:"          SIZE 030, 007 OF oDlgPvt                    PIXEL
            @ 040, 006   MSGET oGetPsw VAR    cGetPsw           SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 PIXEL PASSWORD
          
            //Get de Log, pois se for Say, não da para definir a cor
            @ 060, 006   MSGET oGetErr VAR    cGetErr           SIZE (nJanLarg/2)-12, 007 OF oDlgPvt COLORS 0, 16777215 NO BORDER PIXEL
            oGetErr:lActive := .F.
            oGetErr:setCSS("QLineEdit{color:#FF0000; background-color:#FEFEFE;}")
           
            //Botões
            @ (nJanAltu/2)-18, 006 BUTTON oBtnConf PROMPT "Confirmar"             SIZE (nJanLarg/2)-12, 015 OF oDlgPvt ACTION (fVldUsr()) PIXEL
            oBtnConf:SetCss("QPushButton:pressed { background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #dadbde, stop: 1 #f6f7fa); }")
    ACTIVATE MSDIALOG oDlgPvt CENTERED
      
    //Se a rotina foi confirmada e deu certo, atualiza o usuário e a senha
    If lRetorno
        cUsrLog := Alltrim(cGetUsr)
        cPswLog := Alltrim(cGetPsw)
    EndIf

Return lRetorno
  
Static Function fVldUsr()
    Local cUsrAux := Alltrim(cGetUsr)
    Local cPswAux := Alltrim(cGetPsw)
      
    //Pega o código do usuário
    If cUsrAux == Usuario .and. cPswAux == Senha
        lRetorno := .T.
       
     //Senão atualiza o erro e retorna para a rotina
     Else
         cGetErr := "Usuário e/ou senha inválidos!"
         oGetErr:Refresh()//Refresh faz a mensagem dentro de cGetErr aparecer na tela, pois acima o activate estava em .F.
    EndIf
      
    //Se o retorno for válido, fecha a janela
    If lRetorno
        oDlgPvt:End()
    EndIf

Return
