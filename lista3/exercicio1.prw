// 1 � Fa�a uma consulta na tabela SC7 para retornar todos os pedidos realizados para o fornecedor
// �Super Cabos�. Apresente o resultado em uma fun��o de mensagem com a seguinte estrutura:
// Pedido 1: PC0001
// Pedido 2: PC0002 ...

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function PediSuperC()
    local aArea     := GetArea() // V� qual a �rea (tabela e registros) que est�o abertos e salva dentro do array aArea
    local cAlias    := GetNextAlias() //Pega uma tabela gen�rica dispon�vel pra fazer uma comunica��o com o banco de dados
    local cQuery    := '' //Consulta
    local cCodigo   := 'F00004'
    local cDescri   := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM' // Prepara o ambiente como se tivesse usando o m�dulo de compras do Protheus.
    cQuery := 'SELECT C7_NUM' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
    cQuery += "WHERE C7_FORNECE = '" + cCodigo + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW // Funciona como o DbSeek

    while &(cAlias)->(!EOF())
        cDescri := &(cAlias)->(C7_NUM)
        &(cAlias)->(DbSkip())
    enddo

    FwAlertInfo('Fornecedor: ' + cCodigo + CRLF + 'Pedido: ' + cDescri, 'SuperCabos')
    
    &(cAlias)->(DbCloseArea())
    RestArea(aArea) // Restaura a �rea salva dentro da array aArea   
Return 
