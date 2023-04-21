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

/*/{Protheus.doc} User Function Ex1L12
    Planilha de Cadastro de Fornecedores
    @type  Function
    @author Tamíris Cordeiro
    @since 20/04/2023
    /*/
User Function Ex1L12()
    local aArea   := GetArea()
    local cAlias  := GetNextAlias()
    local cQuery  := ''
    
    local cPath      := 'C:\Users\irisc\OneDrive\Área de Trabalho\'
    local cArq       := 'Fornecedores.xls'
    local cWorkSheet := 'Cadastro de Fornecedores'
    local cTable     := 'Fornecedores'
    local cString    := ''
    local oExcel     := FwMsExcelEx():New()

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := 'SELECT A2_COD, A2_NOME, A2_LOJA, A2_CGC, A2_END, A2_BAIRRO, A2_MUN, A2_EST ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
    cQuery += "WHERE D_E_L_E_T_ = ' ' " + CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    oExcel:AddWorkSheet(cWorkSheet)
    oExcel:AddTable(cWorkSheet, cTable)

    //Colunas
    oExcel:AddColumn(cWorkSheet, cTable, 'Código',    CENTER, NUMBER)
    oExcel:AddColumn(cWorkSheet, cTable, 'Nome',      LEFT, GENERAL)
    oExcel:AddColumn(cWorkSheet, cTable, 'Loja',      LEFT, NUMBER)
    oExcel:AddColumn(cWorkSheet, cTable, 'CPF/CNPJ',  LEFT, NUMBER)
    oExcel:AddColumn(cWorkSheet, cTable, 'Endereço',  LEFT, GENERAL)
    oExcel:AddColumn(cWorkSheet, cTable, 'Bairro',    LEFT, GENERAL)
    oExcel:AddColumn(cWorkSheet, cTable, 'Cidade',    LEFT, GENERAL)
    oExcel:AddColumn(cWorkSheet, cTable, 'Estado',    CENTER, GENERAL)


    while (cAlias)->(!EOF())

        if Empty((cAlias)->(A2_CGC))
            cString := 'Não Informado'
            
        elseif Len(AllTrim((cAlias)->(A2_CGC))) == 11
            cString := Alltrim(Transform((cAlias)->(A2_CGC), "@R 999.999.999-99"))

        elseif Len(AllTrim((cAlias)->(A2_CGC))) == 14
            cString := Alltrim(Transform((cAlias)->(A2_CGC), "@R 99.999.999/9999-99"))

        endif

        //? Adicionando linhas com dados em cada coluna
        oExcel:AddRow(cWorkSheet, cTable, {AllTrim((cAlias)->(A2_COD)), AllTrim((cAlias)->(A2_NOME)), AllTrim((cAlias)->(A2_LOJA)), cString, AllTrim((cAlias)->(A2_END)), AllTrim((cAlias)->(A2_BAIRRO)), AllTrim((cAlias)->(A2_MUN)), AllTrim((cAlias)->(A2_EST))})
    
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

    DbCloseArea()
    RestArea(aArea)

    oExcel:DeActivate()
Return
