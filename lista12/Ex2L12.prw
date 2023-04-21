#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

//?alinhamento
#DEFINE LEFT   1
#DEFINE CENTER 2
#DEFINE RIGHT  3

//?formatação
#DEFINE GENERAL    1
#DEFINE NUMBER     2
#DEFINE ACCOUNTING 3
#DEFINE DATETIME   4

/*/{Protheus.doc} User Function Ex2L12
    Planilha de Produtos Cadastrados
    @type  Function
    @author Tamíris Cordeiro
    @since 20/04/2023
    /*/
User Function Ex2L12()
    local cAlias  := GeraCons()

    GeraPlan(cAlias)
Return

Static Function GeraCons()
    local aArea     := GetArea()
    local cAlias    := GetNextAlias()
    local cQuery     := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

	cQuery += 'SELECT B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_PRV1, D_E_L_E_T_ AS DEL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
        cAlias := ''
    endif

    RestArea(aArea)
Return cAlias

Static Function GeraPlan(cAlias)
    local cPath      := 'C:\Users\irisc\OneDrive\Área de Trabalho\'
    local cArq       := 'Produtos.xls'
    local cWorkSheet := 'Produtos Cadastrados'
    local cTable     := 'Produtos'
    local oExcel     := FwMsExcelEx():New()

    oExcel:AddWorkSheet(cWorkSheet)
    oExcel:AddTable(cWorkSheet, cTable)

    oExcel:SetCelFRColor('#FF0000')

    //Colunas
    oExcel:AddColumn(cWorkSheet, cTable, 'Código',      CENTER, NUMBER)
    oExcel:AddColumn(cWorkSheet, cTable, 'Descrição',   LEFT, GENERAL)
    oExcel:AddColumn(cWorkSheet, cTable, 'Tipo',        CENTER, NUMBER)
    oExcel:AddColumn(cWorkSheet, cTable, 'Un. Medida',  CENTER, NUMBER)
    oExcel:AddColumn(cWorkSheet, cTable, 'Preço Venda', CENTER, ACCOUNTING)

    while (cAlias)->(!EOF())

        if (cAlias)->(DEL) == '*'
            oExcel:AddRow(cWorkSheet, cTable, {AllTrim((cAlias)->(B1_COD)), AllTrim((cAlias)->(B1_DESC)), AllTrim((cAlias)->(B1_TIPO)), AllTrim((cAlias)->(B1_UM)), ((cAlias)->(B1_PRV1))}, {1,2,3,4,5})
        else
            oExcel:AddRow(cWorkSheet, cTable, {AllTrim((cAlias)->(B1_COD)), AllTrim((cAlias)->(B1_DESC)), AllTrim((cAlias)->(B1_TIPO)), AllTrim((cAlias)->(B1_UM)), ((cAlias)->(B1_PRV1))})
        endif
    
        DbSkip()
    enddo

    oExcel:Activate()
    oExcel:GetXMLFile(cPath + cArq)

    if ApOleClient('MsExcel')
        oExec := MsExcel():New()
        oExec:WorkBooks:Open(cPath + cArq)
        oExec:SetVisible(.T.)
        oExec:Destroy()

    else
        FwAlertError('Excel não encontrado na máquina local!', 'Excel não encontrado!')
    endif

        FwAlertSuccess('Arquivo gerado com sucesso!', 'Concluído!')

    oExcel:DeActivate()
Return
