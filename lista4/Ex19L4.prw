// 19 – Altere a rotina do exercício anterior para que não seja possível excluir um curso cadastrado.


#INCLUDE 'TOTVS.CH'

User Function Ex19L4()

    Local cAlias := 'ZZS', cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
