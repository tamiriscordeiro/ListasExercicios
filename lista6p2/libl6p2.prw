#INCLUDE 'TOTVS.CH'

User Function ValTipo()
    Local aArea := GetArea()
    Local lRet  := .T.
    Local _nPosTES  := aScan(aHeader,{|x| Alltrim(x[2]) == "C7_TES"     })

    DO CASE
        CASE Empty(aCols[n,_nPosTES])
        APMsgStop("Tipo de entrada não preenchido, favor preencher!" , 'Negado')
        lRet := .f.

    END CASE

    RestArea(aArea)
Return lRet

User Function Mensagem()
    
    MSGINFO('Botão acionado com sucesso ', 'Sucesso')

Return

User Function BotCadPro()
    Local aArea     := GetArea()
    Local cAlias    := 'SB1'
    Local aRotina   := {}

    Aadd(aRotina, {'Pesquisar',   'AxPesqui', 0, 1})
    Aadd(aRotina, {'Visualizar',  'AxVisual', 0, 2})
    Aadd(aRotina, {'Incluir',     'AxInclui', 0, 3})
    Aadd(aRotina, {'Alterar',     'AxAltera', 0, 4})
    Aadd(aRotina, {'Excluir',     'AxDeleta', 0, 5})


    DbSelectArea('SB1')
    DbSetOrder(1)

    MBrowse(NIL, NIL, NIL, NIL, cAlias)

    DbCloseArea()
    RestArea(aArea)
Return
