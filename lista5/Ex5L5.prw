//5 – Ler dois arrays (A e B), de 20 elementos cada e calcular um terceiro (C), onde cada elemento será
// a soma dos correspondentes em A e B. Apresentar o array resultante.

#INCLUDE "TOTVS.CH"

User Function Ex5L5()
    local aA     := {}
    local aB     := {}
    local aC     := {}
    local nCont  := 0

    FOR nCont := 1 TO 20
        aAdd(aA, (Randomize(1 , 20)))
        aAdd(aB, (Randomize(1 , 20)))
        aAdd(aC, ( aA[nCont] + aB[nCont]))
    NEXT

    FwAlertSuccess('O vetor A é: ' + ArrToKStr(aA) + CRLF +;
                   'O vetor B é: ' + ArrToKStr(aB) + CRLF +;
                   'O vetor C é: ' + ArrToKStr(aC) + CRLF)

Return
