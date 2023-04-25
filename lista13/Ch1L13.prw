#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO RGB(000,000,000)

#DEFINE MAX_LINE 770
#DEFINE LINHA_1  105

/*/{Protheus.doc} User Function Ch1L13
    Gerando relatório em pdf com log de eventos
    @type  Function
    @author Tamíris Cordeiro
    @since 25/04/2023
    /*/

User Function Ch1L13()
    local cAlias    := GeraQuery()
    local cNomePDF  := AllTrim(M->C5_NUM) + '.pdf'
    local cNomeTXT  := AllTrim(M->C5_NUM) + '.txt'

    Private cPedido := ''
    Private aTxt    := {}

    CriaPasta()

    if !Empty(cAlias)
        Processa({|| MontaRel(cAlias, cNomePDF)}, "Aguarde...", "Gerando Informações.", .F.)
    else
        FwAlertError("Nenhum registro encontrado.", "Atenção!")
    endif

    CriaLog(cNomeTXT)
Return 

Static Function GeraQuery()
    local aArea     := GetArea()
    local cAlias    := GetNextAlias()
    local cQuery := ''

    cQuery := 'SELECT PV.C5_NUM, PV.C5_EMISSAO,CLI.A1_NOME,COND.E4_DESCRI, COND.E4_CODIGO, PROD.C6_ITEM, PROD.C6_PRODUTO, PROD.C6_DESCRI, PROD.C6_QTDVEN, PROD.C6_PRCVEN, PROD.C6_VALOR ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' PV' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SE4') + ' COND ON PV.C5_CONDPAG = COND.E4_CODIGO AND COND.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SA1') + ' CLI ON PV.C5_CLIENTE = CLI.A1_COD AND PV.D_E_L_E_T_ = CLI.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SC6') + ' PROD ON PV.C5_NUM = PROD.C6_NUM AND PROD.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += " WHERE PV.D_E_L_E_T_ = ' ' "
    cQuery += " AND C5_NUM = '" + AllTrim(M->C5_NUM) + " '"

    TCQUERY cQuery ALIAS (cAlias) NEW

    (cAlias)->(DbGoTop())

    if (cAlias)->(Eof())
        cAlias := ''
    endif

    RestArea(aArea)
Return cAlias

Static Function MontaRel(cAlias, cNomePDF)
    local cCaminho := 'C:\totvs12\Protheus\protheus_data\Pedidos de Venda\'
    local cArquivo := cNomePDF

    private nLinha := LINHA_1
    private oPrint
    private oFont10 := TFont():New('Arial',,10,,.F.,,,,,.F.,.F.)
    private oFont12 := TFont():New('Arial',,12,,.T.,,,,,.F.,.F.)
    private oFont14 := TFont():New('Arial',,14,,.T.,,,,,.F.,.F.)
    private oFont16 := TFont():New('Arial',,16,,.T.,,,,,.T.,.F.)

    aAdd(aTxt, 'Criando Relatório definindo fontes e tamanho das fontes' + Time())

    oPrint := FwMsPrinter():New(cArquivo, IMP_PDF, .F., "", .T.,, @oPrint,,,,, .T.)

    oPrint:cPathPDF := cCaminho

    aAdd(aTxt, 'Definindo formato do arquivo e onde será salvo' + Time())

    oPrint:SetPortrait()
    oPrint:SetPaperSize(9)
    oPrint:StartPage()

    aAdd(aTxt, 'Início da página ' + Time())

    Cabeçalho(cAlias)

    ImpDados(cAlias)

    oPrint:EndPage()

    oPrint:Preview()
Return

Static Function Cabeçalho(cAlias)
    local cString := ''

    oPrint:Box(15, 15, 85, 580, '-6')

    oPrint:Line(50, 15, 50, 580,,'-6')

    oPrint:Say(35, 020, 'Empresa/Filial: ' + alltrim(SM0->M0_NOME) + '/' + alltrim(SM0->M0_FILIAL), oFont14)
    oPrint:Say(70, 020, 'Informações do Pedido ' + alltrim((cAlias)->(C5_NUM)), oFont14)
    
    aAdd(aTxt, 'Título do relatório e informações da empresa/filial gerados' + Time())

    oPrint:Say(nLinha, 020, 'CODIGO', oFont12,, PRETO)
    oPrint:Say(nLinha, 200, 'CLIENTE', oFont12,, PRETO)
    oPrint:Say(nLinha, 320, 'PAGAMENTO' , oFont12,, PRETO)
    oPrint:Say(nLinha, 485, 'DATA EMISSÃO'   , oFont12,, PRETO)

    nLinha += 5

    aAdd(aTxt, 'Títulos das colunas foram definidos' + Time())

    oPrint:Line(nLinha, 15, nLinha, 580,, '-6')

    nLinha += 10

    oPrint:Say(nLinha, 020, alltrim((cAlias)->(C5_NUM)), oFont12,, PRETO)

    cString := alltrim((cAlias)->(A1_NOME))

    VeriQuebLn(cString, 20, 200)

    oPrint:Say(nLinha, 320, alltrim((cAlias)->(E4_CODIGO)) + " - " + alltrim((cAlias)->(E4_DESCRI)), oFont12,, PRETO)

    oPrint:Say(nLinha, 485, DtoC(StoD((cAlias)->(C5_EMISSAO))), oFont12,, PRETO)
    
    nLinha += 30

    aAdd(aTxt, 'Dados sobre o pedido foram preenchidos' + Time())

    oPrint:Say(nLinha, 020, 'CODIGO',   oFont12,, PRETO)
    oPrint:Say(nLinha, 200, 'PRODUTO',  oFont12,, PRETO)
    oPrint:Say(nLinha, 400, 'QTD.',     oFont12,, PRETO)
    oPrint:Say(nLinha, 450, 'UNITÁRIO', oFont12,, PRETO)
    oPrint:Say(nLinha, 540, 'TOTAL',    oFont12,, PRETO)

    nLinha += 5

    aAdd(aTxt, 'Títulos das colunas para os itens do pedido foram definidos' + Time())

    oPrint:Line(nLinha, 15, nLinha, 580,, '-6')

    nLinha += 10
Return

Static Function ImpDados(cAlias)
    local cString := ''
    local nTotal  := 0

    aAdd(aTxt, 'Início da impressão dos dados' + Time())
    
    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EoF())
        QuebPag(MAX_LINE)

        cString := alltrim((cAlias)->(C6_PRODUTO))
        VeriQuebLn(cString, 20, 20)

        cString := alltrim((cAlias)->(C6_DESCRI))
        VeriQuebLn(cString, 50, 200)

        oPrint:Say(nLinha, 400, cvaltochar((cAlias)->(C6_QTDVEN)), oFont10,, PRETO)
        oPrint:Say(nLinha, 450, "R$ " + cvaltochar((cAlias)->(C6_PRCVEN)), oFont10,, PRETO)
        oPrint:Say(nLinha, 540, "R$ " + cvaltochar((cAlias)->(C6_VALOR)), oFont10,, PRETO)
        
        nLinha += 30

        IncProc()

        aAdd(aTxt, 'Foi inserido um item' + Time())

        nTotal += (cAlias)->(C6_VALOR)

        aAdd(aTxt, 'Valor total foi incrementado' + Time())

        (cAlias)->(DbSkip())
    Enddo

    oPrint:Line(nLinha, 450, nLinha, 580)

    nLinha += 10

    oPrint:Say(nLinha, 450, "TOTAL", oFont12,, PRETO)

    oPrint:Say(nLinha, 530, "R$ " + cvaltochar(nTotal), oFont12,, PRETO)

    aAdd(aTxt, 'Totalizador foi acrescentado ao relatório' + Time())

    aAdd(aTxt, 'Fim do relatório' + Time())
Return

Static Function VeriQuebLn(cString, nChar, nColuna)
    local cText     := ''
    local lQuebra   := .F.
    local nLinhas   := MlCount(cString, nChar,, .F.)
    local nCount    := 0

    if nLinhas > 1
        lQuebra := .T.
        For nCount := 1 to nLinhas
            cText := MemoLine(cString, nChar, nCount)

            oPrint:Say(nLinha, nColuna, cText, oFont10,, PRETO)

            nLinha += 10
        Next
    else

        oPrint:Say(nLinha, nColuna, cString, oFont10,, PRETO)

    endif

    if lQuebra
        nLinha -= (nLinhas * 10)
    endif
Return

Static Function QuebPag(nLinhaFinal)
    if nLinha > nLinhaFinal
        oPrint:EndPage()
        oPrint:StartPage()
        nLinha := LINHA_1
        Top(cAlias)
    endif
Return

Static Function CriaPasta()
    local cCaminho   := '\'
    local cNomePasta := 'Pedidos de Venda\'
    local cDelPasta  := ''

    if !ExistDir(cCaminho + cNomePasta) 
        if MakeDir(cCaminho + cNomePasta) == 0 
            FwAlertSuccess('Pasta Criada com sucesso!', 'Parabéns!')
        else
            FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Atenção')
        endif
    else
        if MsgYesNo('Já existe uma pasta neste local com o nome ' + cNomePasta + ', deseja sobrepô-la?')
            cDelPasta := cCaminho + cNomePasta

            DelPasta(cDelPasta)

                if MakeDir(cCaminho + cNomePasta) == 0
                    FwAlertSuccess('Pasta Criada com sucesso!', 'Parabéns!')
                else
                    FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Atenção')
                endif
        endif
    endif
Return

Static Function DelPasta(cPasta)
    local aArquivos := Directory(cPasta + '.', 'D', , , 1)
    local nI        := 0
    local nTamanho  := Len(aArquivos)
    
    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclusão da pasta anterior?', 'Atenção!')
            if nTamanho > 0
                for nI := 3 to nTamanho
                   if FErase(cPasta + aArquivos[nI][1]) == -1
                        MsgStop('Houve um erro ao apagar o arquivo ' + aArquivos[nI][1])
                   endif
                next
            endif

            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso!', 'Concluído')
            else
                FwAlertError('Houve um erro ao excluir a pasta', 'Erro!')
            endif
        endif
    endif
Return

Static Function CriaLog(cNomeTXT)
    Local cPasta := 'C:\totvs12\Protheus\protheus_data\Pedidos de Venda\'
    Local cArquivo := cNomeTXT
    Local oWriter := FwFileWriter():New(cPasta + cArquivo, .T.)
    Local cLog    := ARRTOKSTR(aTxt, CRLF)

    if File(cPasta + cArquivo)
        FwAlertInfo('O arquivo já existe!', 'Atenção!')
    else
        if !oWriter:Create()
            FwAlertError('Houve um erro ao gerar o arquivo!' + CRLF + 'Erro:' + oWriter:Error():Message, 'Erro!')
        else
            oWriter:Write(cLog)
            oWriter:Close()

            if MsgYesNo('Arquivo gerado com sucesso! (' + cPasta + cArquivo + ')' + CRLF + 'Deseja abrir o arquivo?', 'Abrir?')
                ShellExecute('OPEN', cArquivo, '', cPasta, 1)
            endif
        endif
    endif
Return
