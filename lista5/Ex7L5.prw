//7 � Ler um array A de 15 elementos e a partir dele construir um array B de mesmo tamanho, sendo o
// inverso de A, ou seja, o primeiro elemento de B dever� receber o �ltimo de A o segundo de B
// dever� receber o pen�ltimo de A e assim por diante.

User Function Ex7L5()
    Local aA      := {}
    Local aB      := {}
    Local nCOnt   := 0
    Local cMostra := ''

    aAdd(aA , Randomize(1, 49))

    For nCont := len(aA) to 1 step -1
        AADD(aB, aA[nCont])
    Next

    For nCont := 1 to 15
        If nCont < 15
            cMostra += cValToChar(aB[nCont]) + ', '
        Else 
            cMostra += cValToChar(aB[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Array')
Return
