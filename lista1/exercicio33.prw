#INCLUDE "TOTVS.CH"

// - Faça um algoritmo para ler 20 números e armazenar em um array aNumeros, verificar e
// escrever se existem números repetidos no array aNumeros e em que posições se encontram.

User Function MesmoNumPos()

    local aNumeros   [20]
    local nCont      := 0
    local nI         := 0
    local cCompara   := ""
 
    
    For nCont := 1 to 20
        aNumeros[nCont]:= FwInputBox('Digite o ' + AllTrim(STR(nCont)) + 'ª número para o array.')
    next
    
    For nCont := 1 to 20
        For nI := nCont + 1 to 20
            if aNumeros[nCont] == aNumeros[nI]
                cCompara += 'O número ' + aNumeros[nCont] + 'se encontra nas posições ' + AllTrim(STR(nCont)) + ' e ' + AllTrim(STR(nI)) + CRLF
            endif 
        next
    Next

    MSGINFO(cCompara)
Return
