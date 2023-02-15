#INCLUDE "TOTVS.CH"

// - Escreva um algoritmo que imprima as seguintes sequências de números:
// o (1, 1 2 3 4 5 6 7 8 9 10)
// o (2, 1 2 3 4 5 6 7 8 9 10)
// o (3, 1 2 3 4 5 6 7 8 9 10)
// o (4, 1 2 3 4 5 6 7 8 9 10)
// e assim sucessivamente, até que o primeiro número (antes da vírgula), também chegue a 10.
// Obs: Utilize laço de repetição para o preenchimento dos números antes e depois da vírgula.

User Function SequenciaNum()

    local nI      := 1
    local nJ      := 1
    local cRes    := ''
    local cLinha  := ''

    for nI := 1 to 10
        cLinha := ''
        cLinha += alltrim(Str(nI)) + ' , '
        for nJ := 1 to 10
            if nJ < 10
                cLinha += alltrim(Str(nJ)) + ' '

            else
                cLinha += alltrim(Str(nJ)) + '. '   

            endif    
        next 

        cRes += cLinha + CHAR(13)    

    next         

    FwAlertInfo('Resultado:' + CRLF + cRes)

Return
