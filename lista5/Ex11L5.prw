// 11 - Ler um array A com 10 elementos. Construir um array B com a mesma dimens�o, sendo que cada
// elemento de B seja o somat�rio do primeiro at� o elemento correspondente de A. 
// Apresentar os elementos do array B.

#INCLUDE 'TOTVS.CH'

User Function Ex11L5()
    local aA    := {} 
    local aB    := {} 
    local nAux  := 0
    local nCont := 0

    for nCont := 1 TO 10
        aAdd(aA, (Randomize(1 , 49)))
        nAux += aA[nCont]
        aAdd(aB, ( nAux ))
    next 

    FwAlertSuccess('A matriz A �: ' + ArrTokStr(aA,",") + CRLF + ;
                   'A matriz B �: ' + ArrTokStr(aB,","))

Return
