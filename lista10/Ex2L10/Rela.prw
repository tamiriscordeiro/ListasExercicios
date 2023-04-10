#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function Rela
    Relatório de Fornecedores
    @type  Function
    @author Tamíris Cordeiro
    @since 06/04/2023
    /*/
User Function Rela()
    local oReport := GeraReport()

    oReport:PrintDialog()    
Return 

Static Function GeraReport()
    local cAlias := GetNextAlias()
    local oRel 
    local oSection 

    oRel := TReport():New('Rela', 'Relatório de Fornecedores',,{|oReL| Imprime(oRel, cAlias)}, 'Esse relatório imprimirá o cadastro dos fornecedores.',.F.,,,, .T., .T.)

    oSection := TRSection():New(oRel, 'Cadastros de Fornecedores')

    TRCell():New(oSection, 'A2_COD', 'SA2', 'Código', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'A2_NOME','SA2', 'Nome', /*Picture*/, 30, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'A2_END','SA2', 'Endereço', /*Picture*/, 30, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'A2_EST','SA2', 'Estado', /*Picture*/, 4, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection, 'A2_MUN','SA2', 'Município', /*Picture*/, 20, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )

Return oRel

Static Function Imprime(oRel,cAlias)
    local oSection  := oRel:Section(1)
    local nTotReg   := 0
    local cQuery    := GeraQuery()

    DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oRel:SetMeter(nTotReg)
    oRel:SetTitle('Relatório de Fornecedores')
    oRel:StartPage()
    oSection:Init()

    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        if oRel:Cancel()
            exit 
        endif 

        oSection:Cell('A2_COD'):SetValue((cAlias)->(A2_COD))
        oSection:Cell('A2_NOME'):SetValue((cAlias)->(A2_NOME))
        oSection:Cell('A2_END'):SetValue((cAlias)->(A2_END))
        oSection:Cell('A2_EST'):SetValue((cAlias)->(A2_EST))
        oSection:Cell('A2_MUN'):SetValue((cAlias)->(A2_MUN))

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
	cQuery += 'SELECT A2_COD, A2_NOME, A2_END, A2_EST, A2_MUN' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE A2_COD = '" + Alltrim(SA2->A2_COD) + " ' AND D_E_L_E_T_= ' '" + CRLF
Return cQuery
