// 20 � Lembra do campo B1_ZZGRP que criamos h� algum tempo? Pois �, vamos utilizar ele agora!

// Desenvolva uma fun��o que ser� executada num gatilho do campo B1_TIPO. 
// Essa fun��o retornar� o Grupo de Produto para o campo B1_ZZGRP.
// A fun��o receber� o tipo de produto e, com base nele, preencher� o Grupo de Produto (B1_ZZGRP) seguindo as seguintes regras:
// Se o Tipo for �MP�, o Grupo de Produtos recebe �Mat�ria Prima Produ��o�
// Se o Tipo for �PA�, o Grupo de Produtos recebe �Produto para Comercializa��o�
// Para qualquer outro Tipo, o Grupo de Produtos recebe �Outros Produtos�
// Para testar se funcionou, realize o processo de cadastrar novos produtos selecionando diferentes Tipos de produtos.

#INCLUDE 'TOTVS.CH'

User Function PGRP()
    local cMsg := ""

    if M->B1_TIPO == "MP"
        cMsg := "MATERIA PRIMA PRODUCAO"

    elseif M->B1_TIPO == "PA"
        cMsg := "PRODUTO PARA COMERCIALIZACAO"
        
    else    
        cMsg := "OUTROS PRODUTOS"
    endif
Return cMsg
