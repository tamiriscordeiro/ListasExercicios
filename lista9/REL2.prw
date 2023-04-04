#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function REL2
   Relat�rio com cabe�alho
    @type  Function
    @author Tam�ris Cordeiro
    @since 03/04/2023
    /*/
User Function REL2()
    private cTitulo       := 'Relat�rio de Produtos'
    private cAlias      := 'SB1'
    private cProgram    := 'PSAY'
    private cDesc1      := 'Impress�o do Relat�rio de Produtos'
    private cSize       := 'M'
    private aReturn     := {'Zebrado', 1, 'Administra��o', 1, 2,'' ,'' , 1}
    private cNomeRel    := 'Produtos'
    private m_pag       := 1

   cNomeRel := SetPrint(cAlias, cProgram, , @cTitulo, cDesc1, , , .F., , .T., cSize, , .F.)

    SetDefault(aReturn, cAlias)

    RptStatus({|| Priinter()}, cTitulo, 'Gerando Relat�rio')
        
Return

Static Function Priinter()
    local cCabec    := ' C�DIGO              DESCRI��O                        UN. MED.                  PRE�O              ARMAZ�M        '
    local nLinha    := 8
    local aColunas  := {}

    Aadd(aColunas, 001)
    Aadd(aColunas, 012)
    Aadd(aColunas, 055)
    Aadd(aColunas, 074)
    Aadd(aColunas, 100)

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))

    Cabec(cTitulo, cCabec, '', , cSize)

    while !EOF()
        @ nLinha, aColunas[1] PSAY PADR(Alltrim(SB1->B1_COD), 10)
		@ nLinha, aColunas[2] PSAY PADR(Alltrim(SB1->B1_DESC), 30)
		@ nLinha, aColunas[3] PSAY PADR(Alltrim(SB1->B1_UM), 30)

        If !Empty(SB1->B1_PRV1)
            @ nLinha, aColunas[4] PSAY PADR('R$ ' + cValToChar(NoRound(SB1->B1_PRV1,2)), 10)
            nLinha++
        Else
           @ nLinha, aColunas[4] PSAY PADR('R$ 0,00', 10)
            nLinha++
        Endif

        @ nLinha, aColunas[5] PSAY PADR(Alltrim(SB1->B1_LOCPAD), 30)

        ++nLinha

        SB1->(DbSkip())
    enddo

    SET DEVICE TO SCREEN

    if aReturn[5] == 1
        SET PRINTER TO DbCommitAll()
        OurSpool(cNomeRel)
    endif 

    MS_FLUSH()

Return
