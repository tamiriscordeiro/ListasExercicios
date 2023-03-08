#INCLUDE 'TOTVS.CH'

User Function M030INC()
    Local aArea     := GetArea()
    Local aAreaSA1  := SA1->(GetArea())
    Local lRetorno  := .F.

    if ExistBlock('BloqCli')
        lRetorno := ExecBlock('BloqCli', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSA1)
Return lRetorno
