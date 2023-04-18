#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO RGB(000,000,000)

#DEFINE PAD_RIGHT 1
#DEFINE MAX_LINE 770

/*/{Protheus.doc} User Function Ex3L11
    Relatório de Pedidos de Compras
    @type  Function
    @author Tamíris Cordeiro
    @since 14/04/2023
    /*/
User Function Ex3L11()
    local cAlias := GeraCons()

    if !Empty(cAlias)
         Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'Imprimindo relatório...', .F.)
    else 
        FwAlertError('Nenhum registro encontrado!')
    endif 
Return

Static Function GeraCons()
    local aArea     := GetArea()
    local cAlias    := GetNextAlias()
    localcQuery     := ''

    Local cQuery := ''
	cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
    cQuery += " AND C7_NUM = '" + SC7->C7_NUM + " '"

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
        cAlias := ''
    endif

    RestArea(aArea)
Return cAlias

Static Function MontaRel(cAlias)
    local cCaminho := 'C:\Users\irisc\OneDrive\Área de Trabalho\'
    local cArquivo := 'PedCom.pdf'

    private nLinha  := 105
    private nColIni := 20
    private nColFim := 820
    private oPrint

    private oFont10 := TFont():New('Arial', /*comp*/, 10, /*comp*/, .F., /*COMP*/, /*COMP*/, /*COMP*/, /*COMP*/,.F., .F.)
    private oFont12 := TFont():New('Arial', /*comp*/, 12, /*comp*/, .T., /*COMP*/, /*COMP*/, /*COMP*/, /*COMP*/,.F., .F.)
    private oFont14 := TFont():New('Arial', /*comp*/, 14, /*comp*/, .T., /*COMP*/, /*COMP*/, /*COMP*/, /*COMP*/,.F., .F.)
    private oFont16 := TFont():New('Arial', /*comp*/, 16, /*comp*/, .T., /*COMP*/, /*COMP*/, /*COMP*/, /*COMP*/,.T., .F.)

    oPrint := FWMSPRINTER():New(cArquivo, IMP_PDF, .F., '', .T., /*TR*/, @oPrint, '', /*LServ*/, /*c*/, /*raw*/, .T.)

    oPrint:cPathPDF := cCaminho

    oPrint:SetPortrait()
    oPrint:SetPaperSize(9)

    oPrint:StartPage()

    Cabecalho(cAlias)
    ImpPed(cAlias)

    oPrint:EndPage()

    oPrint:Preview()
Return

Static Function Cabecalho(cAlias)
    local cString   := ''
    private nCor    := 0

    oPrint:Box(15, 15, 85, 580, '-8')
    oPrint:Line(50, 15, 50, 580, /*cor*/, '-6')

    oPrint:Say(35, 20, 'Empresa / Filial: ' + AllTrim(SM0->M0_NOME) + ' / ' + AllTrim(SM0->M0_FILIAL), oFont14, , PRETO)
    oPrint:Say(70, 220, 'Relatório do Pedido de Compra:', oFont16,, PRETO)
    
    oPrint:Say(nLinha, 20,  'Nº PEDIDO',  oFont12,, PRETO)
    oPrint:Say(nLinha, 100, 'DATA',       oFont12,, PRETO)
    oPrint:Say(nLinha, 230, 'FORNECEDOR', oFont12,, PRETO)
    oPrint:Say(nLinha, 400, 'LOJA',       oFont12,, PRETO)
    oPrint:Say(nLinha, 500, 'PAGAMENTO',  oFont12,, PRETO)

    nLinha += 10

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    VeriQuePg()

    oPrint:Say(nLinha, 20, AllTrim((cAlias)->(C7_NUM)), oFont10,, nCor) //Nº PEDIDO

    oPrint:Say(nLinha, 100, AllTrim((cAlias)->(DtoC(StoD((cAlias)->C7_EMISSAO)))), oFont10,, nCor) //DATA EMISSÃO

    cString := AllTrim((cAlias)->(C7_FORNECE)) //FORNECEDOR
    VeriQuebLn(cString, 30, 230) //FORNECEDOR

    cString := AllTrim((cAlias)->(C7_LOJA)) //LOJA
    VeriQuebLn(cString, 30, 400) //LOJA

    cString := AllTrim((cAlias)->(C7_COND)) //PAGAMENTO
    VeriQuebLn(cString, 30, 500) //PAGAMENTO

    nLinha += 10

    IncProc()

    (cAlias)->(DbSkip())

   oPrint:Line(nLinha, 15, nLinha, 580, PRETO, '-6')

    nLinha += 20

    oPrint:Say(nLinha, 20,  'COD. PRODUTO',  oFont12,, PRETO)
    oPrint:Say(nLinha, 100, 'DESCRIÇÃO',     oFont12,, PRETO)
    oPrint:Say(nLinha, 300, 'QTD. VENDIDA',  oFont12,, PRETO)
    oPrint:Say(nLinha, 400, 'R$ UNITÁRIO',   oFont12,, PRETO)
    oPrint:Say(nLinha, 500, 'R$ TOTAL',      oFont12,, PRETO)

    nLinha += 10

Return

Static Function ImpPed(cAlias)
    local cString   := ''
    private nCor    := 0

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        VeriQuePg()

        oPrint:Say(nLinha, 20, AllTrim((cAlias)->(C7_PRODUTO)), oFont10,, nCor) //CÓDIGO

        cString := AllTrim((cAlias)->(C7_DESCRI)) //NOME
        VeriQuebLn(cString, 30, 100) //NOME

        if (cAlias)->(C7_QUANT) == 0 // QUANTIDADE
            cString := '0'
        else
            cString := cValToChar((cAlias)->(C7_QUANT)) // QUANTIDADE
        endif

        oPrint:Say(nLinha, 320, cString, oFont10,, nCor) // QUANTIDADE

        if (cAlias)->(C7_PRECO) == 0 // VALOR UNITÁRIO
            cString := '0.00'
        else
            cString := cValToChar((cAlias)->(C7_PRECO)) // VALOR UNITÁRIO
        endif

        oPrint:Say(nLinha, 410, 'R$ ' + cString, oFont10,, nCor) // VALOR UNITÁRIO

        if (cAlias)->(C7_TOTAL) == 0 // VALOR TOTAL
            cString := '0.00'
        else
            cString := cValToChar((cAlias)->(C7_TOTAL)) // VALOR TOTAL
        endif

        oPrint:Say(nLinha, 510, 'R$ ' + cString, oFont10,, nCor) // VALOR TOTAL

        nLinha += 30

        IncProc()

        (cAlias)->(DbSkip())
    enddo 
Return

Static Function VeriQuebLn(cString, nQtdCar, nCol)
    local cTxtLinha  := ''
    local lTemQuebra := .F.
    local nQtdLinhas := MLCount(cString, nQtdCar, , .F.)
    local nI         := 0

    if nQtdLinhas > 1
        lTemQuebra := .T.

        for nI := 1 to nQtdLinhas
            cTxtLinha := MemoLine(cString, nQtdCar, nI)

            oPrint:Say(nLinha, nCol, cTxtLinha, oFont10,, nCor)
                nLinha += 10
        next
    else 
        oPrint:Say(nLinha, nCol, cString, oFont10,, nCor)
    endif

    if lTemQuebra
        nLinha -= nQtdLinhas * 10
    endif
Return

Static Function VeriQuePg()
    if nLinha > MAX_LINE
        oPrint:EndPage()
        oPrint:StartPage()

        nLinha := 105

        Cabecalho()
    endif
Return
