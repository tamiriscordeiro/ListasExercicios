#INCLUDE "TOTVS.CH"

User Function PrecoProd()
//- Fa�a um algoritmo para ler: a descri��o do produto (nome), a quantidade adquirida e o pre�o unit�rio.
// Calcular e escrever o total (total = quantidade adquirida * pre�o unit�rio), o desconto e o total
// a pagar (total a pagar = total - desconto), sabendo-se que:
// o Se quantidade <= 5 o desconto ser� de 2%
// o Se quantidade > 5 e quantidade <= 10 o desconto ser� de 3%
// o Se quantidade > 10 o desconto ser� de 5%

local cNome         := ""
local nQuantidade   := 0
local nPreco        := 0
local nDesc         := 0
local nTotal        := 0

    cNome := FwInputBox('Descri��o do Produto: ', cNome)

    nQuantidade := FwInputBox('Quantidade: ')
        nQuantidade := val(nQuantidade)
    
    nPreco := FwInputBox('Pre�o unit�rio:')
        nPreco := val(nPreco)

    if nQuantidade <= 5
        nDesc := ((nQuantidade * nPreco) * 0.02)
        nTotal := (nQuantidade * nPreco) - nDesc

        FwAlertInfo('O valor de ' + cValToChar(nQuantidade) + " "  + cNome + ' � R$ : ' + cValToChar(nTotal))
    
        elseif (nQuantidade > 5) .AND. (nQuantidade <=10)
            nDesc := ((nQuantidade * nPreco) * 0.03)
            nTotal := (nQuantidade * nPreco) - nDesc

            FwAlertInfo('O valor de ' + cValToChar(nQuantidade) + " "  + cNome + ' � R$ : ' + cValToChar(nTotal))

            elseif nQuantidade > 10
                nDesc := ((nQuantidade * nPreco) * 0.05)
                nTotal := (nQuantidade * nPreco) - nDesc

                FwAlertInfo('O valor de ' + cValToChar(nQuantidade) + " "  + cNome + ' � R$ : ' + cValToChar(nTotal))
    endif
      
Return 
