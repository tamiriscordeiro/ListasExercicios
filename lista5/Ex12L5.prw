// 12 - Ler um array A com 5 elementos. 
// Construir um array B com a mesma dimensão, onde cada elemento do array B deverá ser o valor inverso (sinal
// trocado) do elemento correspondente do array A. Apresentar os elementos do array B.

#INCLUDE 'TOTVS.CH'

User Function L05Ex12()
    Local aArrayA := {1, 2, 3, 4, 5}
    Local aArrayB := {}
    Local nCont   := 0

    For nCont := 1 to 5
        AADD(aArrayB, (aArrayA[nCont] * -1))
    Next

    FwAlertInfo(ArrTokStr(aArrayB), 'ArrayB')
Return
