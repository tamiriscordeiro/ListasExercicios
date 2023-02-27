// 20 – Altere a rotina do exercício 17 para que no browse do cadastro de alunos sejam apresentadas legendas da seguinte forma:
// o Alunos com mais de 18 anos:
// ? Legenda Verde
// o Alunos com menos de 18 anos:
// ? Legenda Vermelha

// Além disso, o menu deve conter a opção “Legendas” em “Outras Ações”, para que o usuário
// possa entender o que cada cor representa.

#INCLUDE 'TOTVS.CH'

User Function Ex20L4()
    Local cAlias := 'ZZS',  cFiltro   := ''

    Local aCores := { { 'ZZS->ZZS_IDADE > 18' , 'ENABLE' },;
                      { 'ZZS->ZZS_IDADE <= 18' , 'DISABLE' } }

    Private cCadastro := 'Cadastro de alunos '
    Private aRotina := {{ 'Pesquisar' ,    'AxPesqui' ,     0, 1 },;
                        { 'Visualizar' ,   'AxVisual' ,     0, 2 },;
                        { 'Incluir' ,      'AxInclui' ,     0, 3 },;
                        { 'Alterar' ,      'AxAltera' ,     0, 4 },;
                        { 'Excluir' ,      'AxDeleta' ,     0, 5 },;
                        { 'Alunos' ,       'U_CadZZS' ,     0, 6 },;
                        { 'Legenda' ,      'U_Legend',      0, 7 }}

    DbSelectArea('ZZS')
    DbSetOrder(1)

    MBrowse(,,,,cAlias,,,,,,aCores,,,,,,,,cFiltro)     

    DbCloseArea()

Return
