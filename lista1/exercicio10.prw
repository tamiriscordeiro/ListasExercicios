#INCLUDE "TOTVS.CH"
//- Ler 3 valores (considere que n�o ser�o informados valores iguais) e escrev�-los em ordem crescente.

User Function Ordena3()

    local cValor    := ""
    local aValor    := {}
    local nI        := 0
    local cResultado := ""

    for nI := 1 To 3
        cValor := FwInputBox('Digite um numero', cValor)
        aADD(aValor,Val(cValor))
    next

    ASORT(aValor)

    for nI := 1 to len(aValor)
        if nI < len(aValor)
            cResultado += alltrim(str(aValor[nI])) + ', '
        elseif nI = 3
            cResultado += alltrim(str(aValor[nI])) + '.'
        endif    
    next nI

    FwAlertInfo('Os n�meros em ordem crescente s�o: ' + cResultado)

Return
