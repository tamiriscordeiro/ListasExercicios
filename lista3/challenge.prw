// Automatizando o preenchimento do Grupo de Produtos em produtos já cadastrados...
// Crie uma função que percorrerá toda a tabela de cadastro de produtos e, para cada produto, se o
// campo B1_ZZGRP não estiver preenchido, atualize-o de acordo com as regras do exercício 20.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function PAUT()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ""
    Local cMsg   := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "SELECT " + CRLF
    cQuery += "     B1_COD " + CRLF
    cQuery += "     ,B1_FILIAL " + CRLF
    cQuery += "     ,B1_TIPO " + CRLF
    cQuery += "     ,B1_ZZGRP " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') + CRLF
    cQuery += " WHERE "
    cQuery += "      B1_ZZGRP = ' '"


    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        if &(cAlias)->(B1_TIPO) == "PA"
            cMsg := "PRODUTO PARA COMERCIALIZACAO"

        elseif &(cAlias)->(B1_TIPO) == "MP"
        
            cMsg := "MATERIA PRIMA PRODUCAO"
        else
            cMsg := "OUTROS PRODUTOS"
        endif

        DbSelectArea("SB1")
        DbSetOrder(1)

        If DbSeek(&(cAlias)->(B1_FILIAL) + &(cAlias)->(B1_COD))

            RecLock("SB1", .F.)
            SB1->B1_ZZGRP := cMsg
            MsUnlock()
        endif

        &(cAlias)->(DBSKIP())
    End While

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
