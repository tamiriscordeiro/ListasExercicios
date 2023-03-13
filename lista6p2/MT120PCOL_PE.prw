// 1 � Utilizando Ponto de Entrada, fa�a uma valida��o na inclus�o / altera��o dos Pedidos de Compra,
// onde n�o ser� poss�vel adicionar um novo item (nova linha no grid) caso o campo �Tipo de
// Entrada� n�o esteja preenchido. A cada tentativa de adicionar um novo item, se o Tipo de Entrada
// n�o estiver preenchido, uma mensagem de erro deve ser apresentada.

#INCLUDE 'TOTVS.CH'

User Function MT120PCOL()
    Local aArea     := GetArea()
    Local aAreaSC7  := SC7->(GetArea())
    Local lRetorno  := .F.

    if ExistBlock('ValTipo')
        lRetorno := ExecBlock('ValTipo', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSC7)
Return
