#INCLUDE "TOTVS.CH"

//- Fa�a um programa que realiza o sorteio de um nome. 
// Os nomes contidos no programa devem os nomes dos participantes da trilha de capacita��o do Projeto Start II.

User Function SorteioStart()
    local aNomes    := {'Tam�ris','Pintor','Edison','Dani','Giu','Gabriela','Ruan','Quirino','Jo�o','Gustavo',;
                        'Natan','Ste','Rick','Lucas','F�bio'}
    local nSort  := 0

    nSort := RANDOMIZE(1 , len(aNomes))

    FwAlertSuccess('O ganhador do sorteio foi : ' + aNomes[nSort])

Return
