#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function CONDO
    CONDOMINIO
    @type  Function
    @author Tamíris Cordeiro
    @since 30/03/2023
    /*/
User Function CONDO()
    local cAlias    := 'ZS5'
    local cTitle    := 'Condomínio'
    local oBrowse   := NIL

    oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:Activate()
    
Return

Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir'       ACTION 'VIEWDEF.CADBLO' OPERATION 3 ACCESS 0 
  ADD OPTION aRotina TITLE 'Visualizar'    ACTION 'VIEWDEF.CONDO' OPERATION 2 ACCESS 0
  ADD OPTION aRotina TITLE 'Alterar'       ACTION 'VIEWDEF.CONDO' OPERATION 4 ACCESS 0 
  ADD OPTION aRotina TITLE 'Excluir'       ACTION 'VIEWDEF.CONDO' OPERATION 5 ACCESS 0 
  
Return aRotina

Static Function ModelDef()
    local oModel
    local oStruZS5 := FWFormStruct(1, 'ZS5')
    local oStruZS6 := FWFormStruct(1, 'ZS6')

    oStruZS5:SetProperty('ZS5_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZS5", "ZS5_COD")'))
    
    oStruZS5:SetProperty('ZS5_BLOCO', MODEL_FIELD_WHEN, {|| .F.})
    oStruZS5:SetProperty('ZS5_DESC' , MODEL_FIELD_WHEN, {|| .F.})
    
    oModel := MPFormModel():New('CONDOM')
    oModel:AddFields('ZS5MASTER', /*cOwner*/, oStruZS5)
    oModel:SetDescription('Blocos do Condomínio')

    oModel:AddGrid('ZS6DETAIL', 'ZS5MASTER', oStruZS6)
    oModel:GetModel('ZS6DETAIL'):SetDescription('Apartamentos')

    oModel:SetRelation('ZS6DETAIL', {{'ZS6_FILIAL', 'xFilial("ZS6")'}, {'ZS6_BLOCO', 'ZS5_COD'}}, ZS6->(IndexKey(1)))
    oModel:GetModel('ZS6DETAIL'):SetUniqueLine({'ZS6_APE'})
    oModel:GetModel('ZS5MASTER'):SetDescription('Blocos do Condomínio')
    oModel:SetPrimaryKey({'ZS5_COD', 'ZS6_COD'})

Return oModel

Static Function ViewDef()
    local oModel := FWLoadModel('CONDO')
    local oStruZS5 := FWFormStruct(2, 'ZS5')
    local oStruZS6 := FWFormStruct(2, 'ZS6')
    local oView

    oView := FWFormView():New()
    oView:SetModel(oModel)
    oView:AddField('VIEW_ZS5', oStruZS5, 'ZS5MASTER')
    oView:AddGrid('VIEW_ZS6', oStruZS6, 'ZS6DETAIL')

    oView:CreateHorizontalBox('BLOCO' , 20)
    oView:CreateHorizontalBox('APE' , 80)

    oView:SetOwnerView('VIEW_ZS5', 'BLOCO')
    oView:SetOwnerView('VIEW_ZS6' , 'APE')

    oView:AddIncrementField('VIEW_ZS6' , 'ZS6_COD')

    oView:EnableTitleView('VIEW_ZS5' , 'Dados dos Blocos')
    oView:EnableTitleView('VIEW_ZS6' , 'Dados dos Apartamentos')

Return oView
