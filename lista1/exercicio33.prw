#INCLUDE "TOTVS.CH"

// - Fa�a um algoritmo para ler 20 n�meros e armazenar em um array aNumeros, verificar e
// escrever se existem n�meros repetidos no array aNumeros e em que posi��es se encontram.

User Function MesmoNumPos()

    local aNumeros   [20]
    local nCont      := 0
    local nI         := 0
    local cCompara   := ""
 
    
    For nCont := 1 to 20
        aNumeros[nCont]:= FwInputBox('Digite o ' + AllTrim(STR(nCont)) + '� n�mero para o array.')
    next
    
    For nCont := 1 to 20
        For nI := nCont + 1 to 20
            if aNumeros[nCont] == aNumeros[nI]
                cCompara += 'O n�mero ' + aNumeros[nCont] + 'se encontra nas posi��es ' + AllTrim(STR(nCont)) + ' e ' + AllTrim(STR(nI)) + CRLF
            endif 
        next
    Next

    MSGINFO(cCompara)
Return
