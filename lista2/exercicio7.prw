// 7 - Ler a hora de início e a hora de fim de um jogo de Poker (considere apenas horas inteiras, 
// sem os minutos) e calcule a duração do jogo em horas,
// sabendo-se que o tempo máximo de duração do jogo é de 24 horas e que o jogo pode iniciar em um
// dia e terminar no dia seguinte.

#INCLUDE "TOTVS.CH"

User Function HorasPoker()
   Local nHoraIni := 0
   Local nHoraFim := 0
   Local nTotal  := 0

    nHoraIni := (FwInputBox('Digite a hora que o jogo começou: ')) //Hora que começou o jogo
        nHoraIni := val(nHoraIni)

    nHoraFim := (FwInputBox('Digite a hora que o jogo acabou: ')) //Hora que acabou o jogo
        nHoraFim := val(nHoraFim)

    
    nTotal := nHoraIni - nHoraFim  //Calcula quantas horas durou o jogo.

    if nHoraIni >= nHoraFim
        nTotal := ( nHoraFim - nHoraIni ) + 24 //Se a hora inicial for menor que a final, soma-se 24 horas porque o jogo durou até o outro dia. 
        FwAlertSuccess('O jogo levou ' + alltrim(Str(nTotal)) + ' horas.', 'Jogo de Poker')
    else
        nTotal := ( nHoraFim - nHoraIni )
        FwAlertSuccess('O jogo levou ' + alltrim(Str(nTotal)) + ' horas.', 'Jogo de Poker') //Caso contrário o jogo durou o total de horas calculado
    endif

Return
