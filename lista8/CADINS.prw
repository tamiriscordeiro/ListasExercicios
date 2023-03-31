#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function CADINS
    Cadastro de Instrutor
    @type  Function
    @author Tamíris Cordeiro
    @since 27/03/2023
    /*/
    
User Function CADINS()
    local cAlias    := 'ZS3'
    local cTitle    := 'Cadastro de Instrutor'
    local oMark     := FwMarkBrowse():New()

    oMark:AddButton('Marcar Todos' , 'U_Marca', , 1)
    oMark:AddButton('Desmarcar Todos', 'U_Desmarca', , 1)
    oMark:AddButton('Excluir Marcados' , 'U_Deleta', 5, 1)

    oMark:SetAlias(cAlias)
    oMark:SetDescription(cTitle)
    oMark:SetFieldMark('ZS3_MARC')
    oMark:DisableDetails()
    oMark:DisableReport()
    oMark:Activate()

Return

Static Function MenuDef()
    local aRotina   := {}

    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.CADINS' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.CADINS' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.CADINS' OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()
    local bModelPos := {|oModel| ValidPos(oModel)}
    local oModel    := MPFormModel():New('CADINSM', , bModelPos)
    local oStruZS3  := FwFormStruct(1, 'ZS3')
    
    oStruZS3:SetProperty('ZS3_COD',    MODEL_FIELD_INIT,    FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZS3", "ZS3_COD")'))
    
    oModel:AddFields('ZS3MASTER', , oStruZS3)

    oModel:SetDescription('Instrutores')
    oModel:GetModel('ZS3MASTER'):SetDescription('Instrutores')

    oModel:SetPrimaryKey({'ZS3_COD'})

Return oModel

Static Function ViewDef()
    local oModel    := FwLoadModel('CADINS')
    local oStruZS3  := FwFormStruct(2, 'ZS3')
    local oView     := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZS3', oStruZS3, 'ZS3MASTER')

    oView:CreateHorizontalBox('INSTRUTOR' , 100)

    oView:SetOwnerView('VIEW_ZS3', 'INSTRUTOR')

    oView:EnableTitleView('VIEW_ZS3', 'Instrutores')

Return oView

Static Function ValidPos(oModel)
  local nOper     := oModel:GetOperation()
  local dDtNs     := oModel:GetValue('ZS3MASTER', 'ZS3_DATNAS')
  local dDtHb     := oModel:GetValue('ZS3MASTER', 'ZS3_DATHAB')
  local cEscolar  := oModel:GetValue('ZS3MASTER' , 'ZS3_ESCOLA')
  local nQtdAlu   := oModel:GetValue('ZS3MASTER' , 'ZS3_QTDALU')
  local lRet      := .T.

  if nOper == 5
    if val(nQtdAlu) > 0
      lRet := .F.
        Help(NIL, NIL, "Exclusão não realizada", NIL, "Instrutor possui alunos", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Remova os alunos desse instrutor."})
      endif
  elseif nOper == 3 .or. nOper == 4
    if dDtNs > Date() - 7665
      lRet := .F.
        Help(NIL, NIL, "Instrutor não cadastrado.", NIL, "Instrutor precisa ter no mínimo 21 anos.", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Contrate outro instrutor ou verifique a data de nascimento."})
    elseif dDtHb > Date() - 730
      lRet := .F.
        Help(NIL, NIL, "Habilitação Inválida", NIL, "Instrutor possui habilitação a menos de 2 anos", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Contrate outro instrutor ou verifique a data da habilitação."})
    elseif UPPER(cEscolar) == '001'
      lRet := .F.
        Help(NIL, NIL, "Instrutor não cadastrado.", NIL, "Escolaridade não permitida.", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Contrate outro instrutor ou verifique a escolaridade."})
    endif     
  endif

Return lRet

User Function Marca()
  DbSelectArea('ZS3')
  
  ZS3->(DbGotop())
  
  while ZS3->(!EOF())
    if !oMark:IsMark() 
      oMark:MarkRec()  
    endif
    ZS3->(DbSkip())
  enddo

  oMark:Refresh(.T.)
Return

User Function Desmarca()
  DbSelectArea('ZS3')
  
  ZS3->(DbGotop())
  
  while ZS3->(!EOF())
    if oMark:IsMark() 
      oMark:MarkRec() 
    endif
    ZS3->(DbSkip())
  enddo
  
  oMark:Refresh(.T.) 
Return

User Function Deleta()
  if MsgYesNo('Confirma a exclusão dos instrutores selecionados?')
    DbSelectArea('ZS3')
    
    ZS3->(DbGotop())
    
    while ZS3->(!EOF())
      if oMark:IsMark() .and. ((ZS3->ZS3_QTDALU) < 1)  
          RecLock('ZS3', .F.)
            ZS3->(DbDelete()) 
          ZS3->(MSUnlock())
      endif
      ZS3->(DbSkip())
    enddo
  endif
  
  oMark:Refresh(.T.) 
Return

User Function Escola()
    local cEscola := ""

    cEscola += "001=Ensino Fundamental;"
    cEscola += "002=Ensino Médio;"
    cEscola += "003=Ensino Superior;"

Return cEscola

