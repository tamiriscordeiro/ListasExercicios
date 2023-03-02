// 10 –Ler dois arrays: A com 10 elementos e B com 15 elementos. 
// Construir um array C, sendo este, a junção dos outros dois arrays. 
// Desta forma, C deverá ter a capacidade de armazenar 25 elementos. 
// Apresentar o array C.

#INCLUDE 'TOTVS.CH'

User Function L05Ex10()
    Local aArrayA := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    Local aArrayB := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
    Local aArrayC := {}
    Local nCont   := 0
    
    aArrayC := aClone(aArrayA)

    For nCont := 1 to 15
        AADD(aArrayC, aArrayB[nCont])
    Next

    FwAlertInfo(ArrTokStr(aArrayC), 'ArrayC')
Return
