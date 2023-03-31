#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function CADCAT
    Cadastro da Categoria da CNH
    @type  Function
    @author Tamíris Cordeiro
    @since 27/03/2023
    /*/
    
User Function CADCAT()
  Local cAlias  := 'ZS1'
  Local cTitle  := 'Categorias da CNH'
  Local oBrowse := NIL
  
  oBrowse := FwMBrowse():New()

  oBrowse:SetAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:DisableDetails()
  oBrowse:Activate()

Return

Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.CADCAT' OPERATION 3 ACCESS 0 
  ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.CADCAT' OPERATION 4 ACCESS 0 
  ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.CADCAT' OPERATION 5 ACCESS 0 
  
Return aRotina

Static Function ModelDef()
  Local oModel
  Local oStruZS1 := FWFormStruct(1, 'ZS1')
  Local aGatilho := FWStruTrigger('ZS1_CODVEI', 'ZS1_NOMVEI', 'ZS2->ZS2_NOME', .T., 'ZS2', 1, 'xFilial("ZS2")+Alltrim(M->ZS1_CODVEI)')

  oStruZS1:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])
  
  oStruZS1:SetProperty('ZS1_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZS1", "ZS1_COD")'))
  
  oModel := MPFormModel():New('CADCATM')
  oModel:AddFields('ZS1MASTER', /*cOwner*/, oStruZS1)
  oModel:SetDescription('Categorias da CNH')
  
  oModel:GetModel('ZS1MASTER'):SetDescription('Categorias CNH')
  oModel:SetPrimaryKey({'ZS1_COD'})

Return oModel 

Static Function ViewDef()
  Local oModel   := FWLoadModel('CADCAT') 
  Local oStruZS1 := FWFormStruct(2, 'ZS1') 
  Local oView 
  
  oView := FWFormView():New()
  oView:SetModel(oModel)
  oView:AddField('VIEW_ZS1', oStruZS1, 'ZS1MASTER')

  oView:CreateHorizontalBox('TELA' , 100)
  oView:SetOwnerView('VIEW_ZS1', 'TELA')

Return oView

User Function zOpCnh()
    local aArea     := GetArea() 
    local cOpcao    := ""
    
    cOpcao += "001=A;"
    cOpcao += "002=B;"
    cOpcao += "003=C;"
    cOpcao += "004=D;"
    cOpcao += "005=E;"

    RestArea(aArea)

Return cOpcao
