// 12 � Fa�a uma rotina que apresenta, dentre todos os produtos cadastrados, qual o produto com o
// maior pre�o de venda e o produto com o menor pre�o de venda, ou seja, o produto mais caro e o
// mais barato.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function MAI_MEN()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local aNomes  := {}
    Local aCod    := {}
    Local aVal    := {}
    Local cQuery  := ''
    Local cMsg    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     B1_COD " + CRLF
    cQuery += "     ,B1_DESC " + CRLF
    cQuery += "     ,B1_PRV1 " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') +  CRLF
    cQuery += " ORDER BY B1_PRV1 ASC "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        If (&(cAlias)->(B1_PRV1)) > 0
            AADD(aNomes, &(cAlias)->(B1_DESC))
            AADD(aCod, &(cAlias)->(B1_COD))
            AADD(aVal, &(cAlias)->(B1_PRV1))
        Endif
        
        &(cAlias)->(DbSkip())
    Enddo

    cMsg += 'Produto mais barato: ' + aNomes[1] + CRLF + ' C�digo: ' + aCod[1] + ' Pre�o: R$ ' + cValToChar(aVal[1]) + CRLF
    cMsg += 'Produto mais caro: ' + aNomes[len(aNomes)] + CRLF + ' C�digo: ' + aCod[len(aCod)] + ' Pre�o: R$ '  +cValToChar(aVal[len(aVal)]) + CRLF

    FwAlertSuccess(cMsg, 'Produto mais barato e mais caro')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
