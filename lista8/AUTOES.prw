#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function AUTOES
    Autoescola 
    @type  Function
    @author Tamíris Cordeiro
    @since 27/03/2023
    /*/
    
User Function AUTOES()
  Local cAlias  := 'ZS1'
  Local cTitle  := 'Autoescola'
  Local oBrowse := NIL
 
  oBrowse := FwMBrowse():New()
 
  oBrowse:SetAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:DisableDetails()
  oBrowse:Activate()
Return

//? Criação das opções do menu:
Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.AUTOES' OPERATION 2 ACCESS 0 
  
Return aRotina

Static Function ModelDef()
  Local oModel 
  Local oStruZS1 := FWFormStruct(1, 'ZS1')
  Local oStruZS3 := FwFormStruct(1, 'ZS3')
  Local oStruZS4 := FwFormStruct(1, 'ZS4')
   
  oModel := MPFormModel():New('AUTOESM')

    oModel:AddFields("ZS1MASTER", , oStruZS1)

    oModel:AddGrid("ZS3DETAIL", "ZS1MASTER", oStruZS3)
    oModel:AddGrid("ZS4DETAIL", "ZS3DETAIL", oStruZS4)

    oModel:SetRelation('ZS3DETAIL', {{'ZS3_FILIAL', 'xFilial("ZS3")'}, {'ZS3_CATINS', 'ZS1_SIGLA'}}, ZS3->(IndexKey(1)))
    oModel:SetRelation('ZS4DETAIL', {{'ZS4_FILIAL', 'xFilial("ZS4")'}, {'ZS4_CODINS', 'ZS3_COD'}}, ZS4->(IndexKey(1)))

  oModel:SetPrimaryKey({'ZS1_COD'})
Return oModel

Static Function ViewDef()
  Local oModel   := FWLoadModel('AUTOES') 
  Local oStruZS1 := FWFormStruct(2, 'ZS1') 
  Local oStruZS3 := FWFormStruct(2, 'ZS3') 
  Local oStruZS4 := FWFormStruct(2, 'ZS4') 
  Local oView 
  
  oView := FWFormView():New()
  oView:SetModel(oModel)

  oStruZS1:RemoveField('ZS1_DESC')
  oStruZS1:RemoveField('ZS1_CODVEI')

  oStruZS3:RemoveField('ZS3_DATNAS')
  oStruZS3:RemoveField('ZS3_DATHAB')
  oStruZS3:RemoveField('ZS3_ESCOLA')

  oStruZS4:RemoveField('ZS4_NASC')
  oStruZS4:RemoveField('ZS4_CPF')
  oStruZS4:RemoveField('ZS4_AULAS')
  oStruZS4:RemoveField('ZS4_CODINS')
  
  oView:AddField('VIEW_ZS1', oStruZS1, 'ZS1MASTER')
  oView:AddGrid('VIEW_ZS3', oStruZS3, 'ZS3DETAIL')
  oView:AddGrid('VIEW_ZS4', oStruZS4, 'ZS4DETAIL')

  oView:CreateHorizontalBox('CNH' , 25)
  oView:CreateHorizontalBox('INSTRUTOR' , 35)
  oView:CreateHorizontalBox('ALUNO' , 40)

  oView:SetOwnerView('VIEW_ZS1', 'CNH')
  oView:EnableTitleView('VIEW_ZS1', 'Dados da CNH')

  oView:SetOwnerView('VIEW_ZS3', 'INSTRUTOR')
  oView:EnableTitleView('VIEW_ZS3', 'Instrutores')

  oView:SetOwnerView('VIEW_ZS4', 'ALUNO')
  oView:EnableTitleView('VIEW_ZS4', 'Alunos do Instrutor')

Return oView
