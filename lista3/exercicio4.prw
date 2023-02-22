//4 � Fa�a um SELECT na tabela SB1 que retorne todos os produtos que pertencem ao grupo
//�Pel�culas�. Apresente a descri��o desses produtos atrav�s da fun��o FwAlertInfo()

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function GP002()
    local aArea     := GetArea() // V� qual a �rea (tabela e registros) que est�o abertos e salva dentro do array aArea
    local cAlias    := GetNextAlias() //Pega uma tabela gen�rica dispon�vel pra fazer uma comunica��o com o banco de dados
    local cQuery    := '' //Consulta
    local cGrupo    := 'G002'
    local cDescri   := ''
    local cMsg      := ''
    local cCont     := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM' // Prepara o ambiente como se tivesse usando o m�dulo de compras do Protheus.
    cQuery := 'SELECT B1_DESC' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
    cQuery += "WHERE B1_GRUPO = '" + cGrupo + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW // Funciona como o DbSeek

    while &(cAlias)->(!EOF())
        cDescri := &(cAlias)->(B1_DESC)
        cMsg += ('Grupo: ' + cGrupo + CRLF + 'Descri��o: ' + cDescri + CRLF) 
        &(cAlias)->(DbSkip())
        cCont ++
    enddo

    FwAlertInfo(cMsg, 'Pel�culas')
    
    &(cAlias)->(DbCloseArea())
    RestArea(aArea) // Restaura a �rea salva dentro da array aArea   
Return
