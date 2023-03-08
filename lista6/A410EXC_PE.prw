// 2 � Crie um campo na tabela SC5 com as seguintes
// caracter�sticas:
// o Nome do Campo: Tipo de Inclus�o
// o Op��es do Campo (Lista): Manual / Autom�tico
// Ap�s criar o campo, utilize um ponto de entrada
// para impedir a exclus�o de pedidos de venda que
// tenham esse novo campo com o valor �Autom�tico�.

User Function A410EXC()
    Local aArea     := GetArea()
    Local aAreaSC5  := SC5->(GetArea())
    Local lRetorno  := .F.

    if ExistBlock('ValidaExc')
        lRetorno := ExecBlock('ValidaExc', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSC5)
Return lRetorno
