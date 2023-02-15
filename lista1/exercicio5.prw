#INCLUDE "TOTVS.CH"

User Function CustoCarro()
//- O custo de um carro novo ao consumidor é a soma do custo de fábrica com a porcentagem do distribuidor 
// e dos impostos (aplicados ao custo de fábrica). Supondo que o percentual do distribuidor
// seja de 28% e os impostos de 45%, escrever um algoritmo para ler o custo de fábrica de um carro,
// calcular e escrever o custo final ao consumidor.

local cCustoFab     := ""
local nCustoFab     := 0
local nCustoConsu   := 0

    cCustoFab := FwInputBox('Digite o custo de fábrica:', cCustoFab)
        nCustoFab := val(cCustoFab)
   
    nCustoConsu := nCustoFab + ((nCustoFab * 0,28) * 0,45)

    FwAlertSuccess('O valor para o consumidor é' + cValToChar(nCustoConsu) + '!')
      
Return 
