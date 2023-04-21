#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

//?alinhamento
#DEFINE LEFT   1
#DEFINE CENTER 2
#DEFINE RIGHT  3

//?formatação
#DEFINE GENERAL    1
#DEFINE NUMBER     2
#DEFINE ACCOUNTING 3
#DEFINE DATETIME   4

/*/{Protheus.doc} User Function Ex3L12
    Planilha de Alunos por Curso
    @type  Function
    @author Tamíris Cordeiro
    @since 20/04/2023
    /*/
User Function Ex3L12()
    local cAlias  := GeraCons()

    GeraPlan(cAlias)
Return

Static Function GeraCons()
    local aArea     := GetArea()
    local cAlias    := GetNextAlias()
    local cQuery     := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

	cQuery := 'SELECT ZZC.ZZC_COD, ZZC.ZZC_CURSO, ZZX.ZZX_COD, ZZX.ZZX_CURSO, ZZX.ZZX_NOME, ZZX.ZZX_DTINIC ' + CRLF
    cQuery += 'FROM ' + RetSqlName("ZZC") + " ZZC " + CRLF
    cQuery += " INNER JOIN " + RetSqlName("ZZX") + " ZZX " + CRLF
    cQuery += " ON ZZC.ZZC_COD = ZZX.ZZX_CURSO AND ZZX.D_E_L_E_T_ = ZZC.D_E_L_E_T_ 
    cQuery += "WHERE ZZX.D_E_L_E_T_ = ' '"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
        cAlias := ''
    endif

    RestArea(aArea)
Return cAlias

Static Function GeraPlan(cAlias)
    local cPath      := 'C:\Users\irisc\OneDrive\Área de Trabalho\'
    local cArq       := 'Alunos.xls'
    local cTable     := 'Alunos do Curso'
    local cCurso     := ''
    local cCod       := ''
    local oExcel     := FwMsExcelEx():New()

    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())
        If cCod != ((cAlias)->(ZZC_COD))
            cCurso := Alltrim((cAlias)->(ZZC_CURSO))

            oExcel:AddWorkSheet(cCurso)

            oExcel:AddTable(cCurso, cTable)

            oExcel:AddColumn(cCurso, cTable, 'Codigo',         LEFT, GENERAL)
            oExcel:AddColumn(cCurso, cTable, 'Nome',           LEFT, GENERAL)
            oExcel:AddColumn(cCurso, cTable, 'Data de Início', LEFT, DATETIME)
        Endif

        //? Adicionando linhas com dados em cada coluna
            oExcel:AddRow(cCurso, 'Alunos do Curso', {AllTrim((cAlias)->(ZZX_COD)), AllTrim((cAlias)->(ZZX_NOME)), StoD((cAlias)->(ZZX_DTINIC))})

        cCod := ((cAlias)->(ZZC_COD))

        DbSkip()
    enddo

    oExcel:Activate()
    oExcel:GetXMLFile(cPath + cArq)

    if ApOleClient('MsExcel')
        oExec := MsExcel():New()
        oExec:WorkBooks:Open(cPath + cArq)
        oExec:SetVisible(.T.)
        oExec:Destroy()

    else
        FwAlertError('Excel não encontrado na máquina local!', 'Excel não encontrado!')
    endif

        FwAlertSuccess('Arquivo gerado com sucesso!', 'Concluído!')

    oExcel:DeActivate()
Return
