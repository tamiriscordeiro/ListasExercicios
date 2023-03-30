#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function CADBLO
    Cadastro dos Blocos
    @type  Function
    @author Tamíris Cordeiro
    @since 30/03/2023)
    /*/
User Function CADBLO()
    local cAlias    := 'ZS5'
    local cTitle    := 'Cadastro de Blocos'
    local oBrowse   := NIL

    oBrowse := FwMBrowse():New()

  oBrowse:SetAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:DisableDetails()
  oBrowse:Activate()
    
Return

Static Function MenuDef()
    local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar'    ACTION 'VIEWDEF.CADBLO' OPERATION 2 ACCESS 0 
    ADD OPTION aRotina TITLE 'Incluir'       ACTION 'VIEWDEF.CADBLO' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'       ACTION 'VIEWDEF.CADBLO' OPERATION 4 ACCESS 0 
    ADD OPTION aRotina TITLE 'Excluir'       ACTION 'VIEWDEF.CADBLO' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    local oModel
    local oStruZS5 := FWFormStruct(1, 'ZS5')

    oModel := MPFormModel():New('CADBLOM')

    oStruZS5:SetProperty('ZS5_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZS5", "ZS5_COD")'))

    oModel:AddFields('ZS5MASTER', , oStruZS5)
    oModel:SetDescription('Cadastro de Blocos')

    oModel:GetModel('ZS5MASTER'):SetDescription('Cadastro de Blocos')
    oModel:SetPrimaryKey({'ZS5_COD'})

Return oModel

Static Function ViewDef()
    local oModel   := FWLoadModel('CADBLO')
    local oStruZS5 := FWFormStruct(2, 'ZS5')
    local oView

    oView := FWFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZS5', oStruZS5, 'ZS5MASTER')

    oView:CreateHorizontalBox('TELA' , 100)
    oView:SetOwnerView('VIEW_ZS5', 'TELA')

    oView:EnableTitleView('VIEW_ZS5' , 'Dados dos Blocos')

Return oView
