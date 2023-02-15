#INCLUDE "TOTVS.CH"

// - Escreva um algoritmo que imprima as seguintes sequ�ncias de n�meros:
// o (1, 1 2 3 4 5 6 7 8 9 10)
// o (2, 1 2 3 4 5 6 7 8 9 10)
// o (3, 1 2 3 4 5 6 7 8 9 10)
// o (4, 1 2 3 4 5 6 7 8 9 10)
// e assim sucessivamente, at� que o primeiro n�mero (antes da v�rgula), tamb�m chegue a 10.
// Obs: Utilize la�o de repeti��o para o preenchimento dos n�meros antes e depois da v�rgula.

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
