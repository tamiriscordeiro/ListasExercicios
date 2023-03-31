#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function CADVEI
    Cadastro de Veículos
    @type  Function
    @author Tamíris Cordeiro
    @since 27/03/2023
    /*/

User Function CADVEI()
    local cAlias    := 'ZS2'
    local cTitle    := 'Cadastro de Veículos'
    local oBrowse   := FwMbrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:Activate()

Return

Static Function MenuDef()
    local aRotina   := {}

    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.CADVEI' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.CADVEI' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.CADVEI' OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()
    local oModel    := MPFormModel():New('CADVEIM')
    local oStruZS2  := FwFormStruct(1, 'ZS2')
    
    oModel:AddFields('ZS2MASTER', , oStruZS2)

    oModel:SetDescription('Veículos')
    oModel:GetModel('ZS2MASTER'):SetDescription('Veículos')

    oModel:SetPrimaryKey({'ZS2_COD'})

Return oModel

Static Function ViewDef()
    local oModel    := FwLoadModel('CADVEI')
    local oStruZS2  := FwFormStruct(2, 'ZS2')
    local oView     := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZS2', oStruZS2, 'ZS2MASTER')

    oView:CreateHorizontalBox('VEICULOS' , 100)
    oView:SetOwnerView('VIEW_ZS2', 'VEICULOS')

    oView:EnableTitleView('VIEW_ZS2', 'Veículos')

Return oView

User Function Cambio()

    local aArea := GetArea()
    local cCambio := ""
    cCambio += "001=MANUAL;"
    cCambio += "002=AUTOMÁTICO;"
    RestArea(aArea)
    
Return cCambio
