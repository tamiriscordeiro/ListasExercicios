// 9 – Ler 8 elementos em um array A tipo vetor.
// Construir um array B de mesma dimensão onde cada elemento é o triplo do elemento correspondente
// do array A.

#INCLUDE 'TOTVS.CH'

User Function L05Ex09()
    Local aArrayA   := {1, 2, 3, 4, 5, 6, 7, 8}
    Local aArrayB   := {}
    Local nContador := 0

    For nContador := 1 to 8
        AADD(aArrayB, aArrayA[nContador] * 3)
    Next

    FwAlertInfo(ArrTokStr(aArrayA), 'ArrayA')
    FwAlertInfo(ArrTokStr(aArrayB), 'ArrayB')
Return
