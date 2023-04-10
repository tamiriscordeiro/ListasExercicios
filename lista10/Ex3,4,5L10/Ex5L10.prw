#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function Ex5L10
    Relatório todas as compras com seus respectivos itens
    @type  Function
    @author Tamíris Cordeiro
    @since 10/04/2023
    /*/
User Function Ex5L10()
    local oReport := GeraReport()

    oReport:PrintDialog()    
Return 

Static Function GeraReport()
    local cAlias := GetNextAlias()
    local oRel 
    local oSection1
    local oSection2

    oRel := TReport():New('Ex5L10', 'Relatório de Pedidos de Compra',,{|oReL| Imprime(oRel, cAlias)}, 'Esse relatório imprimirá todos os pedidos de compras e seus itens.',.F.,,,, .T., .T.)

    oSection1 := TRSection():New(oRel, 'Pedidos de Compras')
    oSection2 := TRSection():New(oSection1, 'Itens do Pedido')


    //pedidos de compra
    TRCell():New(oSection1, 'C7_NUM', 'SC7', 'Nº Pedido', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection1, 'C7_EMISSAO','SC7', 'Data Emissão', /*Picture*/, 15, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection1, 'C7_FORNECE','SC7', 'Fornecedor', /*Picture*/, 30, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection1, 'C7_LOJA','SC7', 'Loja', /*Picture*/, 4, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection1, 'C7_COND','SC7', 'Pagamento', /*Picture*/, 20, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )

    //itens do pedido
    TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Cod Pedido', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C7_DESCRI','SC7', 'Descrição', /*Picture*/, 30, /*Pixel*/, /*Block*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C7_QUANT','SC7', 'Quantidade', /*Picture*/, 8, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C7_PRECO','SC7', 'R$ Unitário', /*Picture*/, 10, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )
    TRCell():New(oSection2, 'C7_TOTAL','SC7', 'R$ Total', /*Picture*/, 10, /*Pixel*/, /*Block*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*nColSpace*/, .T., /*cor fundo*/, /*cor fonte*/, .T. )

    oBreak := TRBreak():New(oSection1, oSection1:Cell('C7_NUM'), , .T.)
	
	// Faz a soma de todos os valores da coluna 'TOTAL'
	TRFunction():New(oSection2:Cell('C7_TOTAL'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.) 

Return oRel

Static Function Imprime(oRel,cAlias)
    local oSection1  := oRel:Section(1)
    local oSection2 := oSection1:Section(1)
    local nTotReg   := 0
    local cQuery    := GeraQuery()

    DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oRel:SetMeter(nTotReg)
    oRel:SetTitle('Relatório de Pedidos de Compra')
    oRel:StartPage()
    oSection1:Init()

    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        if oRel:Cancel()
            exit 
        endif

        oSection1:Cell('C7_NUM'):SetValue((cAlias)->(C7_NUM))
        oSection1:Cell('C7_EMISSAO'):SetValue((cAlias)->(C7_EMISSAO))
        oSection1:Cell('C7_FORNECE'):SetValue((cAlias)->(C7_FORNECE))
        oSection1:Cell('C7_LOJA'):SetValue((cAlias)->(C7_LOJA))
        oSection1:Cell('C7_COND'):SetValue((cAlias)->(C7_COND))

        oSection1:PrintLine()


        oSection2:Init() 

        oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->(C7_PRODUTO))
        oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->(C7_DESCRI))
        oSection2:Cell('C7_QUANT'):SetValue((cAlias)->(C7_QUANT))
        oSection2:Cell('C7_PRECO'):SetValue((cAlias)->(C7_PRECO))
        oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->(C7_TOTAL))

        oSection2:PrintLine()

        oRel:IncMeter()

        (cAlias)->(DbSkip())
    enddo

    (cAlias)->(DbCloseArea())

    oSection2:Finish()
    oSection1:Finish()

    oRel:EndPage()

Return

Static Function GeraQuery()
	Local cQuery := ''
	cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
 
Return cQuery
