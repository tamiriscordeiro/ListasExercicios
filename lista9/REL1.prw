#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function REL1
   Relat�rio sem cabe�alho
    @type  Function
    @author Tam�ris Cordeiro
    @since 03/04/2023
    /*/
User Function REL1()
    local cTitulo       := 'Relat�rio de Produtos'
    private cAlias      := 'SB1'
    private cProgram    := 'PSAY'
    private cDesc1      := 'Impress�o do Relat�rio de Produtos'
    private cSize       := 'M'
    private aReturn     := {'Zebrado', 1, 'Administra��o', 1, 2,'' ,'' , 1}
    private cNomeRel    := 'Produtos'

   cNomeRel := SetPrint(cAlias, cProgram, , @cTitulo, cDesc1, , , .F., , .T., cSize, , .F.)

    SetDefault(aReturn, cAlias)

    RptStatus({|| Priinter()}, cTitulo, 'Gerando Relat�rio')
        
Return

Static Function Priinter()
    local nLinha := 2

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))

    while !EOF()
        nLinha++
        @ nLinha, 00 PSAY PADR('C�digo: ' ,20) + Alltrim(SB1->B1_COD)
        nLinha++

        @ nLinha, 00 PSAY PADR('Descri��o: ', 20) + Alltrim(SB1->B1_DESC)
        nLinha++

        @ nLinha, 00 PSAY PADR('Unidade de Medida: ', 20) + Alltrim(SB1->B1_UM)
        nLinha++

        If !Empty(SB1->B1_PRV1)
            @ nLinha, 00 PSAY PADR('Pre�o de venda: ', 20) + 'R$ ' + cValToChar(NoRound(SB1->B1_PRV1,2))
            nLinha++
        Else
           @ nLinha, 00 PSAY PADR('Pre�o de venda: ', 20) + 'R$ 0,00'
            nLinha++
        Endif

        @ nLinha, 00 PSAY PADR('Armazem: ', 20) + Alltrim(SB1->B1_LOCPAD)
        ++nLinha

        @ nLinha, 00 PSAY Replicate('.', 50)

        SB1->(DbSkip())
    enddo

    SET DEVICE TO SCREEN

    if aReturn[5] == 1
        SET PRINTER TO DbCommitAll()
        OurSpool(cNomeRel)
    endif 

    MS_FLUSH()

Return
