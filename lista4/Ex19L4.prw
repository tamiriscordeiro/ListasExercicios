// 19 � Altere a rotina do exerc�cio anterior para que n�o seja poss�vel excluir um curso cadastrado.


#INCLUDE 'TOTVS.CH'

User Function Ex19L4()

    Local cAlias := 'ZZS', cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
