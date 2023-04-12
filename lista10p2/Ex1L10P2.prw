#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function Ex1L10P2
    Relatório Pedidos de Vendas
    @type  Function
    @author Tamíris Cordeiro
    @since 12/04/2023
    /*/
User Function Ex1L10P2()
    local oReport := GeraReport()

    oReport:PrintDialog()    
Return

Static Function GeraReport()
    local cAlias := GetNextAlias()
    local oReport
    local oSection1
    local oSection2

    oReport := TReport():New('Ex1L10P2', 'Relatório de Pedidos de Vendas',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá todos os pedidos de vendas e seus itens.',.F.,,,, .T., .T.)

    oSection1 := TRSection():New(oReport, 'Pedidos de Vendas')
    oSection2 := TRSection():New(oSection1, 'Itens do Pedido')

    //pedidos de vendas
    TRCell():New(oSection1, 'C5_NUM', 'SC5', 'Nº Pedido', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection1, 'A1_NOME', 'SA1', 'Cliente', /*Picture*/, 30, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection1, 'C5_EMISSAO', 'SC5', 'Data Emissão', /*Picture*/, 14, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection1, 'E4_DESCRI', 'SE4', 'Pagamento', /*Picture*/, 20, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )

    //itens do pedido
    TRCell():New(oSection2, 'C6_ITEM', 'SC6', 'Nº Itens', /*Picture*/, 4, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C6_PRODUTO', 'SC6', 'Código', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C6_DESCRI', 'SC6', 'Produto', /*Picture*/, 20, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C6_QTDVEN', 'SC6', 'Qtd Vendida', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C6_PRCVEN', 'SC6', 'Preço Venda', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C6_VALOR', 'SC6', 'Valor Total', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )

    oBreak := TRBreak():New(oSection1, oSection1:Cell('C5_NUM'), , .T.)
	
	// Faz a soma de todos os valores da coluna 'TOTAL'
	TRFunction():New(oSection2:Cell('C6_VALOR'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.) 

Return oReport

Static Function Imprime(oReport, cAlias)
    local oSection1 := oReport:Section(1)
    local oSection2 := oSection1:Section(1)
    local nTotReg   := 0
    local cUProd    := ''
    local cQuery    := GeraQuery()

    DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oReport:SetMeter(nTotReg)
    oReport:SetTitle('Relatório de Pedidos de Vendas')
    oReport:StartPage()

    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        if oReport:Cancel()
            exit 
        endif 

        if AllTrim(cUProd) <> AllTrim((cAlias)->C5_NUM)
            if !Empty(cUProd)
                oSection2:Finish()
                oSection1:Finish()
                oReport:EndPage()
            endif 

            oSection1:Init()

            oSection1:Cell('C5_NUM'):SetValue((cAlias)->(C5_NUM))
            oSection1:Cell('A1_NOME'):SetValue((cAlias)->(A1_NOME))
            oSection1:Cell('C5_EMISSAO'):SetValue(DtoC(StoD((cAlias)->C5_EMISSAO)))
            oSection1:Cell('E4_DESCRI'):SetValue((cAlias)->(E4_DESCRI))

            cUProd := ((cAlias)->(C5_NUM))

            oSection1:PrintLine()

            oSection2:Init()
        endif   

            oSection2:Cell('C6_ITEM'):SetValue((cAlias)->(C6_ITEM))
            oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->(C6_PRODUTO))
            oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->(C6_DESCRI))
            oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->(C6_QTDVEN))
            oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->(C6_PRCVEN))
            oSection2:Cell('C6_VALOR'):SetValue((cAlias)->(C6_VALOR))

            oSection2:PrintLine()
            oReport:SkipLine(1)

            oReport:IncMeter()

            (cAlias)->(DbSkip())
    enddo

    oSection2:Finish()
    oSection1:Finish()

    (cAlias)->(DbCloseArea())

    oReport:EndPage()
Return

Static Function GeraQuery()
    local cQuery := ''

    cQuery += 'SELECT PV.C5_NUM, PV.C5_EMISSAO,CLI.A1_NOME,COND.E4_DESCRI, PROD.C6_ITEM, PROD.C6_PRODUTO, PROD.C6_DESCRI, PROD.C6_QTDVEN, PROD.C6_PRCVEN, PROD.C6_VALOR ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' PV' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SE4') + ' COND ON PV.C5_CONDPAG = COND.E4_CODIGO AND COND.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SA1') + ' CLI ON PV.C5_CLIENTE = CLI.A1_COD AND PV.D_E_L_E_T_ = CLI.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SC6') + ' PROD ON PV.C5_NUM = PROD.C6_NUM AND PROD.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += " WHERE PV.D_E_L_E_T_ = ' ' "
    cQuery += " AND C5_NUM = '" + AllTrim(SC5->C5_NUM) + " '"

Return cQuery

