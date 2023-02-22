//5 – Faça um SELECT na tabela SB1 que retorne todos os produtos cadastrados e apresente os
//códigos e descrições de todos em uma mensagem.
//Mas atenção, os itens devem ser apresentados em ordem de descrição decrescente (Z-A)

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function DESCALL()
    local aArea     := GetArea() // Vê qual a área (tabela e registros) que estão abertos e salva dentro do array aArea
    local cAlias    := GetNextAlias() //Pega uma tabela genérica disponível pra fazer uma comunicação com o banco de dados
    local cQuery    := '' //Consulta
    local cDescri   := ''
    local cMsg      := ''
    local cCont     := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM' // Prepara o ambiente como se tivesse usando o módulo de compras do Protheus.
    cQuery := 'SELECT B1_DESC' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
    cQuery += "ORDER BY B1_DESC DESC "

    TCQUERY cQuery ALIAS &(cAlias) NEW // Funciona como o DbSeek

    while &(cAlias)->(!EOF())
        cDescri := &(cAlias)->(B1_DESC)
        cMsg += (cDescri + CRLF) 
        &(cAlias)->(DbSkip())
        cCont ++
    enddo

    FwAlertInfo(cMsg, 'Produtos Cadastrados')
    
    &(cAlias)->(DbCloseArea())
    RestArea(aArea) // Restaura a área salva dentro da array aArea   
Return
