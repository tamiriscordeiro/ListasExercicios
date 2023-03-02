// 6 – Ler dois arrays, A e B de 10 elementos cada e calcular um array C onde seu primeiro elemento é o
// primeiro elemento de A, seu segundo elemento é o primeiro de B, seu terceiro elemento é o segundo
// de A, e assim sucessivamente. Note que o array C deverá ter 20 elementos. Exibir o conteúdo do array C.

User Function Ex6L5()
    Local aA      := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    Local aB      := {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
    Local aC      := {}
    Local nCont   := 0
    Local cMostra := ''

    For nCont := 1 to 10
        AADD(aC, aA[nCont])
        AADD(aC, aB[nCont])
    Next

    For nCont := 1 to 20 
        If nCont < 20
            cMostra += cValToChar(aC[nCont]) + ', '
        Else 
            cMostra += cValToChar(aC[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Array')

Return
