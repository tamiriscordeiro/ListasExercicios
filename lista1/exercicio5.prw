#INCLUDE "TOTVS.CH"

User Function CustoCarro()
//- O custo de um carro novo ao consumidor � a soma do custo de f�brica com a porcentagem do distribuidor 
// e dos impostos (aplicados ao custo de f�brica). Supondo que o percentual do distribuidor
// seja de 28% e os impostos de 45%, escrever um algoritmo para ler o custo de f�brica de um carro,
// calcular e escrever o custo final ao consumidor.

local cCustoFab     := ""
local nCustoFab     := 0
local nCustoConsu   := 0

    cCustoFab := FwInputBox('Digite o custo de f�brica:', cCustoFab)
        nCustoFab := val(cCustoFab)
   
    nCustoConsu := nCustoFab + ((nCustoFab * 0,28) * 0,45)

    FwAlertSuccess('O valor para o consumidor �' + cValToChar(nCustoConsu) + '!')
      
Return 
