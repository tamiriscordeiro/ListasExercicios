//4 – Faça um SELECT na tabela SB1 que retorne todos os produtos que pertencem ao grupo
//“Películas”. Apresente a descrição desses produtos através da função FwAlertInfo()

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function GP002()
    local aArea     := GetArea() // Vê qual a área (tabela e registros) que estão abertos e salva dentro do array aArea
    local cAlias    := GetNextAlias() //Pega uma tabela genérica disponível pra fazer uma comunicação com o banco de dados
    local cQuery    := '' //Consulta
    local cGrupo    := 'G002'
    local cDescri   := ''
    local cMsg      := ''
    local cCont     := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM' // Prepara o ambiente como se tivesse usando o módulo de compras do Protheus.
    cQuery := 'SELECT B1_DESC' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
    cQuery += "WHERE B1_GRUPO = '" + cGrupo + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW // Funciona como o DbSeek

    while &(cAlias)->(!EOF())
        cDescri := &(cAlias)->(B1_DESC)
        cMsg += ('Grupo: ' + cGrupo + CRLF + 'Descrição: ' + cDescri + CRLF) 
        &(cAlias)->(DbSkip())
        cCont ++
    enddo

    FwAlertInfo(cMsg, 'Películas')
    
    &(cAlias)->(DbCloseArea())
    RestArea(aArea) // Restaura a área salva dentro da array aArea   
Return
