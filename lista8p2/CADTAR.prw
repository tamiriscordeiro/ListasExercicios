#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function CADTAR
   Cadastro de Tarefas
    @type  Function
    @author Tamíris Cordeiro
    @since 30/03/2023
    /*/
User Function CADTAR()
    local cAlias    := 'ZS7'
    local cTitle    := 'Lista de Tarefas'
    local oBrowse   := NIL

    oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:Activate()
    
Return

Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir'       ACTION 'VIEWDEF.CADTAR' OPERATION 3 ACCESS 0 
  ADD OPTION aRotina TITLE 'Visualizar'    ACTION 'VIEWDEF.CADTAR' OPERATION 2 ACCESS 0
  ADD OPTION aRotina TITLE 'Alterar'       ACTION 'VIEWDEF.CADTAR' OPERATION 4 ACCESS 0 
  ADD OPTION aRotina TITLE 'Excluir'       ACTION 'VIEWDEF.CADTAR' OPERATION 5 ACCESS 0 
  
Return aRotina

Static Function ModelDef()
    local oModel
    local oStruZS7 := FWFormStruct(1, 'ZS7')
    local oStruZS8 := FWFormStruct(1, 'ZS8')

    oStruZS7:SetProperty('ZS7_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZS7", "ZS7_COD")'))
    
    oModel := MPFormModel():New('CADTARM')
    oModel:AddFields('ZS7MASTER', /*cOwner*/, oStruZS7)
    oModel:SetDescription('Tarefas')

    oModel:AddGrid('ZS8DETAIL', 'ZS7MASTER', oStruZS8)
    oModel:GetModel('ZS8DETAIL'):SetDescription('Passos da Tarefa')

    oModel:SetRelation('ZS8DETAIL', {{'ZS8_FILIAL', 'xFilial("ZS8")'}, {'ZS8_COD', 'ZS7_COD'}}, ZS8->(IndexKey(1)))
    oModel:GetModel('ZS7MASTER'):SetDescription('Tarefas')
    oModel:SetPrimaryKey({'ZS7_COD', 'ZS8_COD'})

Return oModel

Static Function ViewDef()
    local oModel := FWLoadModel('CADTAR')
    local oStruZS7 := FWFormStruct(2, 'ZS7')
    local oStruZS8 := FWFormStruct(2, 'ZS8')
    local oView

    oView := FWFormView():New()
    oView:SetModel(oModel)
    oView:AddField('VIEW_ZS7', oStruZS7, 'ZS7MASTER')
    oView:AddGrid('VIEW_ZS8', oStruZS8, 'ZS8DETAIL')

    oView:CreateHorizontalBox('TAREFA' , 20)
    oView:CreateHorizontalBox('PASSOS' , 80)

    oView:SetOwnerView('VIEW_ZS7', 'TAREFA')
    oView:SetOwnerView('VIEW_ZS8' , 'PASSOS')

    oView:AddIncrementField('VIEW_ZS8' , 'ZS8_COD')

    oView:EnableTitleView('VIEW_ZS7' , 'Dados das Tarefas')
    oView:EnableTitleView('VIEW_ZS8' , 'Dados dos Passos')

Return oView

    
Return 
