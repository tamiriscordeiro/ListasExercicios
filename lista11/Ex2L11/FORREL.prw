#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function FORREL
    Relatório de Fornecedores
    @type  Function
    @author Tamíris Cordeiro
    @since 06/04/2023
    /*/
User Function FORREL()
    local cAlias  := 'SA2'
    local cTitle  := 'Cadastro de Fornecedores'
    local oBrowse := NIL

    oBrowse := FwMBrowse():New()
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()

    oBrowse:AddButton('Relatório', 'U_Ex2L11')

    oBrowse:Activate()
Return

Static Function MenuDef()
    local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.FORREL' OPERATION 2 ACCESS 0 //? Adiciona o botão visualizar
    ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.FORREL' OPERATION 3 ACCESS 0 //? Adiciona o botão incluir
    ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.FORREL' OPERATION 4 ACCESS 0 //? Adiciona o botão alterar
    ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.FORREL' OPERATION 5 ACCESS 0 //? Adiciona o botão excluir
 
Return aRotina

Static Function ModelDef()
    Local oModel 
    Local oStruSA2:= FWFormStruct(1, 'SA2')

    oModel := MPFormModel():New('FORRELM')
    oModel:AddFields('SA2MASTER', /*cOwner*/, oStruSA2)

    oModel:SetDescription('Cadastro de Fornecedores')

    oModel:GetModel('SA2MASTER'):SetDescription('Dados do Fornecedor')
    oModel:SetPrimaryKey({'SA2_COD'})
Return oModel

Static Function ViewDef()
    Local oModel   := FWLoadModel('FORREL') // Cria um objeto de Modelo de dados baseado no ModelDef() do fonte informado
    Local oStruSA2 := FWFormStruct(2, 'SA2') // Cria a estrutura a ser usada na View
    Local oView

     oView := FWFormView():New()

     oView:SetModel(oModel)

     oView:AddField('VIEW_SA2', oStruSA2, 'SA2MASTER')

     oView:CreateHorizontalBox('TELA' , 100)

     oView:SetOwnerView('VIEW_SA2', 'TELA')

     Return oView
