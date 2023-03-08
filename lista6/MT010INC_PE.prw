// 1 � Crie um ponto de entrada que seja executado
// na inclus�o/altera��o de produtos. O objetivo
// desse PE � acrescentar o texto �Cad. Manual - �
// antes da descri��o do produto.
// o Ex: �Cad. Manual � Fone de Ouvido�

#INCLUDE 'TOTVS.CH'

User Function MT010INC()
    Local aArea     := GetArea()
    Local aAreaSB1  := SB1->(GetArea())
    Local lRetorno  := .F.

    if ExistBlock('ManuCad')
        lRetorno := ExecBlock('ManuCad', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSB1)
Return lRetorno
