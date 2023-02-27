// 10 – Faça um programa para o cálculo de uma folha de pagamento.

#INCLUDE 'TOTVS.CH'

User Function Ex10L4()

    Local cTitle := 'Desconto IR', cTexto := 'Informe o valor da hora: ', cTexto2 := 'Informe a quantidade de horas: '
    Local nOpcao := 0
    Local oDlg := NIL
    Local nJanLarg := 300
    Local nJanAltu := 200
    Private nHora := Space(10)
    Private nQtdHoras := Space(3)

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2    SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nHora      SIZE 55, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nQtdHoras  SIZE 55, 11 OF oDlg PIXEL

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg

    ACTIVATE MSDIALOG oDlg CENTERED

    if nOpcao == 1
        Pagamento(VAL(nHora), VAL(nQtdHoras))
    Else
        FwAlertError('CANCELADO PELO USUÁRIO', 'CANCELADO')
    endif

Return


Static Function Pagamento(nHora, nQtdHoras)
    Local nIR:= 0
    Local nINSS:= 0
    Local nFGTS:= 0
    Local nTotalDesc:= 0
    Local nSalBruto:= 0
    Local nSalLiq:= 0
    Local cIR := ''

    nSalBruto := nHora * nQtdHoras

    if nSalBruto > 1200 .and. nSalBruto <= 1800  
        nIR := 0.05 * nSalBruto         
        cIR := '5%'
    elseif nSalBruto > 1800 .and. nSalBruto <= 2500 
        nIR := 0.10 * nSalBruto 
        cIR := '10%'
    elseif nSalBruto > 2500 
        nIR := 0.20 * nSalBruto 
        cIR := '20%'
    else
        FwAlertInfo('O valor informado não tem desconto IR!')
        nIR := 1 * nSalBruto
    endif

    nINSS := 0.10 * nSalBruto     
             
    nFGTS := 0.11 * nSalBruto 

    nTotalDesc := nIR + nINSS 

    nSalLiq := nSalBruto-nTotalDesc

    FwAlertInfo('Salário bruto R$: ' + ALLTRIM(Str(nSalBruto,15,2))+CRLF+;
                'IR ('+ALLTRIM(cIR)+'): R$ '+ ALLTRIM(Str(nIR,10,2))+CRLF+;
                'INSS (10%): R$ '+ ALLTRIM(Str(nINSS,6,2))+CRLF+;
                'FGTS (11%): R$ '+ ALLTRIM(Str(nFGTS,6,2))+CRLF+;
                'Total de descontos: R$ '+ ALLTRIM(Str(nTotalDesc,6,2))+CRLF+;
                'Salário Líquido: R$ '+ ALLTRIM(Str(nSalLiq,7,2)))
Return
