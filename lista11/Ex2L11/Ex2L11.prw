#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO RGB(000,000,000)

#DEFINE PAD_RIGHT 1
#DEFINE MAX_LINE 770

/*/{Protheus.doc} User Function Ex2L11
    Relatório de Fornecedores
    @type  Function
    @author Tamíris Cordeiro
    @since 14/04/2023
    /*/
User Function Ex2L11()
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
	cQuery += 'SELECT A2_COD, A2_NOME, A2_END, A2_EST, A2_MUN' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE A2_COD = '" + Alltrim(SA2->A2_COD) + " ' AND D_E_L_E_T_= ' '" + CRLF

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
        cAlias := ''
    endif

    RestArea(aArea)
Return cAlias

Static Function MontaRel(cAlias)
    local cCaminho := 'C:\Users\irisc\OneDrive\Área de Trabalho\'
    local cArquivo := 'RelFor.pdf'

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

    Cabecalho()
    ImpDados(cAlias)

    oPrint:EndPage()

    oPrint:Preview()
Return

Static Function Cabecalho()
    oPrint:Box(15, 15, 85, 580, '-8')
    oPrint:Line(50, 15, 50, 580, /*cor*/, '-6')

    oPrint:Say(35, 20, 'Empresa / Filial: ' + AllTrim(SM0->M0_NOME) + ' / ' + AllTrim(SM0->M0_FILIAL), oFont14, , PRETO)
    oPrint:Say(70, 220, 'Relatório de Fornecedores', oFont16,, PRETO)
    
    oPrint:Say(nLinha, 20,  'CÓDIGO',      oFont12,, PRETO)
    oPrint:Say(nLinha, 100, 'NOME',        oFont12,, PRETO)
    oPrint:Say(nLinha, 230, 'ENDEREÇO',    oFont12,, PRETO)
    oPrint:Say(nLinha, 400, 'MUNICÍPIO',   oFont12,, PRETO)
    oPrint:Say(nLinha, 500, 'ESTADO',      oFont12,, PRETO)

    nLinha += 5

   oPrint:Line(nLinha, 15, nLinha, 580, PRETO, '-6')

    nLinha += 20
Return

Static Function ImpDados(cAlias)
    local cString   := ''
    private nCor    := 0

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        VeriQuePg()

        oPrint:Say(nLinha, 20, AllTrim((cAlias)->(A2_COD)), oFont10,, nCor) //CÓDIGO

        cString := AllTrim((cAlias)->(A2_NOME)) //NOME
        VeriQuebLn(cString, 30, 100) //NOME

        cString := AllTrim((cAlias)->(A2_END)) //ENDEREÇO
        VeriQuebLn(cString, 30, 230) //ENDEREÇO

        cString := AllTrim((cAlias)->(A2_MUN)) //MUNICIPIO
        VeriQuebLn(cString, 30, 400) //MUNICIPIO

        oPrint:Say(nLinha, 520, AllTrim((cAlias)->(A2_EST)), oFont,, nCor) // ESTADO

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
