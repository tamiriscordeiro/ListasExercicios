#INCLUDE "TOTVS.CH"

//- Faça um programa que realiza o sorteio de um nome. 
// Os nomes contidos no programa devem os nomes dos participantes da trilha de capacitação do Projeto Start II.

User Function SorteioStart()
    local aNomes    := {'Tamíris','Pintor','Edison','Dani','Giu','Gabriela','Ruan','Quirino','João','Gustavo',;
                        'Natan','Ste','Rick','Lucas','Fábio'}
    local nSort  := 0

    nSort := RANDOMIZE(1 , len(aNomes))

    FwAlertSuccess('O ganhador do sorteio foi : ' + aNomes[nSort])

Return
