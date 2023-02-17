// 13 - Elaborar um programa que exiba na tela automaticamente todos os múltiplos de um
// determinado número informado pelo usuário, existentes entre 1 e um limite, que também deverá
// ser informado pelo usuário. Faça com apenas uma estrutura de repetição (For / While), antes de
// desenvolver, analise qual será a melhor opção.

#INCLUDE "TOTVS.CH"

User Function UsuMult()
    local nCont := 0
    local cShow := ""
    local nMult := 0
    local nLim  := 0

    nMult := FwInputBox('Digite de qual número será calculado os múltiplos: ')
        nMult := val(nMult)

    nLim := FwInputBox('Digite até qual número você quer saber os múltiplos: ')
        nLim := val(nLim)

    for nCont := 1 to nLim
        if (nCont % nMult == 0)
            cShow := cShow + CVALTOCHAR(nCont) + ' , '
        endif 
    next 
    
    FwAlertSuccess('Os múltiplos desse número são: ' + cShow)

Return
