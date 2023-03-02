// 8 – Fazer um programa que carregue um array de 8 elementos e que inverta a ordem do seu conteúdo.
// Apresente no final o array invertido.
// Obs: Usar apenas um array.

#INCLUDE 'TOTVS.CH'

User Function Ex8L5()
    Local aArray := {'1', '2', '3', '4', '5', '6', '7', '8'}
    Local nCont  := 0

    For nCont := 8 to 1 step -1
        aAdd(aArray, aArray[nCont])
    Next

    For nCont := 1 to 8
        ADEL(aArray, 1)
    Next

    ASIZE(aArray, 8)

    FwAlertInfo(ArrTokStr(aArray))
Return
