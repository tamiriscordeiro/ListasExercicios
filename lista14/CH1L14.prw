#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

STATIC nPCod    := 1
STATIC nPDesc   := 2
STATIC nPTipo   := 3
STATIC nPUnM    := 4
STATIC nPPrV    := 5
STATIC nPAtv    := 6

/*/{Protheus.doc} User Function CH1L14
    Importa arquivo do excel e cadastra novos produtos
    @type  Function
    @author Tamíris Cordeiro
    @since 17/05/2023
    /*/
User Function CH1L14()
    local aArea     := GetArea()
    private cArqOri := ''
    
    cArqOri := tFileDialog("CSV files (*csv) ", 'Seleção de Arquivos', , , .F.)

    if !Empty(cArqOri)
        if File(cArqOri) .and. UPPER(SubStr(cArqOri, RAt('.', cArqOri) + 1, 3)) == 'CSV'
            Processa({|| fImporta()}, "Importando...")
        else
            MsgStop("Arquivo e/ou extensão inválida!", 'Atenção!')
        endif
    endif

    RestArea(aArea)
Return 

Static Function fImporta() //Importa os arquivos do excel
    local cLinha    := ""
    local aLinha    := {}
    local oArquivo  := FWFileReader():New(cArqOri) 
    local cCod      := ""
    local cDesc     := ""
    local cTipo     := ""
    local cUnM      := ""
    local nPrV      := 0
    local cAtv      := ""

    if (oArquivo:Open())
        if !(oArquivo:EoF())
            while (oArquivo:HasLine())
                cLinha := oArquivo:GetLine()
                aLinha := StrTokArr(cLinha, ";")

                cCod     := aLinha[nPCod]
                cDesc    := SubStr(aLinha[nPDesc], 1, 30)
                cTipo    := aLinha[nPTipo]
                cUnM     := aLinha[nPUnM]
                nPrV     := Val(aLinha[nPPrV])
                cAtv     := aLinha[nPAtv]

                if lower(cCod) != "codigo" .and. cAtv != "I" .and. alltrim(cDesc) != "."
                    Produto(cCod, cDesc, cTipo, cUnM, nPrV)
                endif
            enddo 
        else
            MsgStop("O arquivo não pode ser aberto", "Erro!")
        endif
    else
        MsgStop("O arquivo não pode ser aberto", "Erro!")
    endif

    oArquivo:Close()

    FwAlertInfo("Produtos cadastrados com sucesso!", "Concluído!")

Return

Static Function Produto(cCod, cDesc, cTipo, cUnM, nPrV) //Cadastra os produtos na tabela automaticamente
    local aDados := {}
    local nOper := 3 //inclusão

    private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    aAdd(aDados, {'B1_FILIAL'   , xFilial('SB1')    , NIL})
    aAdd(aDados, {'B1_COD'      , cCod              , NIL})
    aAdd(aDados, {'B1_DESC'     , cDesc             , NIL})
    aAdd(aDados, {'B1_TIPO'     , cTipo             , NIL})
    aAdd(aDados, {'B1_UM'       , cUnM              , NIL})
    aAdd(aDados, {'B1_PRV1'     , nPrV              , NIL})
    aAdd(aDados, {'B1_LOCPAD'   , '01'              , NIL})

    MsExecAuto({|x, y| MATA010(x, y)}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif
Return
