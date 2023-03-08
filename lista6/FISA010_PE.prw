#INCLUDE "PROTHEUS.CH"

User Function FISA010()
    local aParam   := PARAMIXB
    local lRet     := .T.
    local oObj     := NIL
    local cIdPonto := ""
    local cIdModel := ""

    if aParam <> NIL
          oObj := aParam[1] // Objeto do formul�rio ou do modelo, conforme o caso.
          cIDPonto := aParam[2] // ID do local de execu��o do ponto de entrada.
          cIDModel := aParam[3] // ID do formul�rio.

        If (cIDPonto == "MODELPOS")       // Na valida��o total do modelo.
            if ExistBlock('MuniCad')
                lRet := ExecBlock('MuniCad', .F.)
            endif
        endif
     EndIf

Return lRet
