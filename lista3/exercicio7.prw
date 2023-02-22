// 7 � Fa�a um programa em que o usu�rio possa digitar um per�odo (data in�cio / data fim) 
// e saber quais s�o os pedidos de venda existentes no per�odo informado.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function PegaTime()
    Local aArea     := GetArea() // Seleciona os dados que a gente tava usando antes da rotina e guardei dentro do array aArea e restaura no RestArea
    Local cAlias    := GetNextAlias()
    Local cQuery    := ""
    Local dData1    := ""
    Local dData2    := ""
    Local cMsg     := ""
    Local nCont     := 0
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

    dData1 := ctod(FwInputBox("Digite a data de in�cio (DD/MM/AA):" ))
    dData2 := ctod(FwInputBox("Digite a data final (DD/MM/AA): "))

    cQuery := "SELECT * FROM " + RetSqlName('SC5') + " WHERE C5_EMISSAO >= '" + DTOS(dData1) + "' AND C5_EMISSAO <= '" + DTOS(dData2) + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
        cMsg += "Pedido: " + &(cAlias)->(C5_NUM) + " Data de Emiss�o: " + cvaltochar(StoD(&(cAlias)->(C5_EMISSAO))) + CRLF + CRLF

            If nCont == 6
                FwAlertInfo(cMsg, 'Pedidos')
                nCont := 0
                cMsg := ''
            Endif'

        nCont++
        &(cAlias)->(DbSkip())
    End

    If nCont > 0 
        FwAlertInfo(cMsg, 'Pedidos')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea) //Restaura a �rea aberta na GetArea

Return
