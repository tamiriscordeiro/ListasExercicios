// 17 – Desenvolva uma rotina que permita realizar cadastros de alunos.

#INCLUDE 'TOTVS.CH'

User Function CadZZE()

    Local cAlias := 'ZZS', cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
