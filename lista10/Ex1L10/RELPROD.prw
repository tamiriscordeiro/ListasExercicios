#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function RELPROD
    Relatório de Produtos usando TReport
    @type  Function
    @author Tamíris Cordeiro
    @since 06/04/2023
    /*/
User Function RELPROD()
    local oReport := GeraReport()

    oReport:PrintDialog()    
Return 

Static Function GeraReport()
    local cAlias := GetNextAlias()
    local oRel 
    local oSection 

    oRel := TReport():New('RELPROD', 'Relatório de Produtos',,{|oReL| Imprime(oRel, cAlias)}, 'Esse relatório imprimirá todos os cadastros de produtos',.F.,,,, .T., .T.)

    oSection := TRSection():New(oRel, 'Cadastros de Produtos')

    TRCell():New(oSection, 'B1_COD', 'SB1', 'Código', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'B1_DESC','SB1', 'Descrição', /*Picture*/, 30, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'B1_UM','SB1', 'Un. Medida', /*Picture*/, 4, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'B1_PRV1','SB1', 'Preço', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'B1_LOCPAD','SB1', 'Armazém', /*Picture*/, 4, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )

Return oRel

Static Function Imprime(oRel,cAlias)
    local oSection  := oRel:Section(1)
    local nTotReg   := 0
    local cQuery    := GeraQuery()

    DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oRel:SetMeter(nTotReg)
    oRel:SetTitle('Relatório de Produtos')
    oRel:StartPage()
    oSection:Init()

    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        if oRel:Cancel()
            exit 
        endif 

        oSection:Cell('B1_COD'):SetValue((cAlias)->(B1_COD))
        oSection:Cell('B1_DESC'):SetValue((cAlias)->(B1_DESC))
        oSection:Cell('B1_UM'):SetValue((cAlias)->(B1_UM))
        oSection:Cell('B1_PRV1'):SetValue((cAlias)->(B1_PRV1))
        oSection:Cell('B1_LOCPAD'):SetValue((cAlias)->(B1_LOCPAD))

        oSection:PrintLine()

        oRel:IncMeter()

        (cAlias)->(DbSkip())
    enddo

    (cAlias)->(DbCloseArea())

    oSection:Finish()

    oRel:EndPage()

Return

Static Function GeraQuery()
	Local cQuery := ''
	cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
Return cQuery
