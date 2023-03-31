#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function CADALU
    Cadastro de Alunos
    @type  Function
    @author Tamíris Cordeiro
    @since 27/03/2023
    /*/

User Function CADALU()
    local cAlias         := 'ZS4'
    local cTitle         := 'Cadastro de Alunos'
    local oMark          := FwMarkBrowse():New()
    private cCodAnterior := ''

    oMark:AddButton('Marcar Todos' , 'U_Marcar', , 1)
    oMark:AddButton('Desmarcar Todos', 'U_Dmarcar', , 1)
    oMark:AddButton('Excluir Marcados' , 'U_Apagar', 5, 1)

    oMark:SetAlias(cAlias)
    oMark:SetDescription(cTitle)
    oMark:SetFieldMark('ZS4_MARC')
    oMark:DisableDetails()
    oMark:DisableReport()
    oMark:Activate()
Return

Static Function MenuDef()
    local aRotina   := {}

    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.CADALU' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.CADALU' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.CADALU' OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()
    local bModelPos := {|oModel| ValidPos(oModel)}
    local oModel    := MPFormModel():New('CADALUM', , bModelPos)
    local oStruZS4  := FwFormStruct(1, 'ZS4')
    local aGatilho := FWStruTrigger('ZS4_CODINS', 'ZS4_NOMINS', 'ZS3->ZS3_NOME', .T., 'ZS3', 1, 'xFilial("ZS3")+Alltrim(M->ZS4_CODINS)')
    
    oStruZS4:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    oStruZS4:SetProperty('ZS4_AULAS', MODEL_FIELD_VALID, { |oModel| ValCampo(oModel)})
    oStruZS4:SetProperty('ZS4_COD',    MODEL_FIELD_INIT,    FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZS4", "ZS4_COD")'))

    oModel:AddFields('ZS4MASTER', , oStruZS4)
    oModel:SetDescription('Cadastro de Alunos')
    oModel:GetModel('ZS4MASTER'):SetDescription('Alunos')

    oModel:SetPrimaryKey({'ZS4_COD'})
    
Return oModel

Static Function ViewDef()
    local oModel    := FwLoadModel('CADALU')
    local oStruZS4  := FwFormStruct(2, 'ZS4')
    local oView     := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZS4', oStruZS4, 'ZS4MASTER')

    oView:CreateHorizontalBox('ALUNOS' , 100)
    oView:SetOwnerView('VIEW_ZS4', 'ALUNOS')

    oView:EnableTitleView('VIEW_ZS4', 'Alunos')

    oView:SetAfterViewActivate({|oView| IAtual(oView)})

Return oView

User Function OpAula()
    local aArea := GetArea()
    local cOp   := ''

    cOp += "SIM;"
    cOp += "NÃO;"

    RestArea(aArea)

Return cOp

User Function Marcar()
  DbSelectArea('ZS4')
  
  ZS4->(DbGotop())
  
  while ZS4->(!EOF())
    if !oMark:IsMark() 
      oMark:MarkRec()  
    endif
    ZS4->(DbSkip())
  enddo

  oMark:Refresh(.T.)
Return

User Function Dmarcar()
  DbSelectArea('ZS4')
  
  ZS4->(DbGotop())
  
  while ZS4->(!EOF())
    if oMark:IsMark() 
      oMark:MarkRec() 
    endif
    ZS4->(DbSkip())
  enddo
  
  oMark:Refresh(.T.) 
Return

User Function Apagar()
  if MsgYesNo('Confirma a exclusão dos alunos selecionados?')
    DbSelectArea('ZS4')
    
    ZS4->(DbGotop())
    
    while ZS4->(!EOF())
      if oMark:IsMark() .and. ((ZS4->ZS4_QTDALU) < 1)  
          RecLock('ZS3', .F.)
            ZS4->(DbDelete()) 
          ZS4->(MSUnlock())
      endif
      ZS4->(DbSkip())
    enddo
  endif
  
  oMark:Refresh(.T.) 
Return

Static Function ValCampo(oModel)
    local lRet      := .T.
    local cEstuda   := oModel:GetValue('ZS4_AULAS')
    local cInst     := oModel:GetValue('ZS4_CODINS')

    if !Empty(cEstuda)
        if Empty(cInst)
            Help(NIL, NIL, 'Instrutor não encontrado.', NIL, 'O campo de instrutor não foi preenchido.', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Preencha o campo  do Instrutor.'})
        endif
    endif
Return lRet

Static Function ValidPos(oModel)
    Local nOperation := oModel:GetOperation()
    Local cCodInst   := oModel:GetValue('ZS4MASTER','ZS4_CODINS')
    Local cAula      := oModel:GetValue('ZS4MASTER','ZS4_AULAS')
    Local nQtdAlun   := 0
    Local lOk        := .T.
     
    ZS3->(DbSelectArea('ZS3'))
    ZS3->(DbGoTop())
    ZS3->(DbSetOrder(1))

    If nOperation == 3
        If ZS3->(DbSeek(xFilial('ZS3')+cCodInst)) 
            nQtdAlun := ZS3->ZS3_QTDALU
            nQtdAlun++
            If ZS3->(Reclock('ZS3', .F.))
                ZS3->ZS3_QTDALU := nQtdAlun
                ZS3->(MSUnlock())
            Endif
        Endif

    Elseif nOperation == 4
        ZS3->(DbSeek(xFilial('ZS3')+cCodAnterior))
        nQtdAlun := ZS3->ZS3_QTDALU
        nQtdAlun--
            If ZS3->(Reclock('ZS3', .F.))
                ZS3->ZS3_QTDALU := nQtdAlun
                ZS3->(MSUnlock())
            Endif

            ZS3->(DbSeek(xFilial('ZS3')+cCodInst)) 
                nQtdAlun := ZS3->ZS3_QTDALU
                nQtdAlun++
                If ZS3->(Reclock('ZS3', .F.))
                    ZS3->ZS3_QTDALU := nQtdAlun
                    ZS3->(MSUnlock())            
                Endif

    Elseif nOperation == 5
        If cAula != 'SIM'
            If ZS3->(DbSeek(xFilial('ZS3')+cCodInst)) 
            
                nQtdAlun := ZS3->ZS3_QTDALU

                If nQtdAlun > 0
                    nQtdAlun--
                    If ZS3->(Reclock('ZS3', .F.))
                        ZS3->ZS3_QTDALU := nQtdAlun
                        ZS3->(MSUnlock())
                    Endif
                Endif
            Endif
        Else
            lOk := .F.
            Help(NIL, NIL, 'Aluno não pode ser excluído', NIL, 'Alunos em aula não podem ser excluídos', 1, 0, NIL, NIL, NIL, NIL, NIL, {'Retire o aluno das aulas (troque de SIM para NÃO).'})
        endif
    Endif

Return lOk

Static Function IAtual(oView)
    cCodAnterior := (ZS4->ZS4_CODINS)
Return 
