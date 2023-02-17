// 13 - Elaborar um programa que exiba na tela automaticamente todos os m�ltiplos de um
// determinado n�mero informado pelo usu�rio, existentes entre 1 e um limite, que tamb�m dever�
// ser informado pelo usu�rio. Fa�a com apenas uma estrutura de repeti��o (For / While), antes de
// desenvolver, analise qual ser� a melhor op��o.

#INCLUDE "TOTVS.CH"

User Function UsuMult()
    local nCont := 0
    local cShow := ""
    local nMult := 0
    local nLim  := 0

    nMult := FwInputBox('Digite de qual n�mero ser� calculado os m�ltiplos: ')
        nMult := val(nMult)

    nLim := FwInputBox('Digite at� qual n�mero voc� quer saber os m�ltiplos: ')
        nLim := val(nLim)

    for nCont := 1 to nLim
        if (nCont % nMult == 0)
            cShow := cShow + CVALTOCHAR(nCont) + ' , '
        endif 
    next 
    
    FwAlertSuccess('Os m�ltiplos desse n�mero s�o: ' + cShow)

Return
