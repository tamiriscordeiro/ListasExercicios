// 14 � Carregar um array com 12 caracteres gerados aleatoriamente (rand�micos).
// Ser�o v�lidos apenas caracteres que representem letras min�sculas (de �a� at� �z�). 
// A carga do array dever� ser feita atrav�s de uma fun��o est�tica que � chamada automaticamente 
// no programa principal. Os caracteres N�O podem se repetir. No final, exibir o vetor gerado.
// Obs: A exibi��o dever� ser feita fun��o est�tica.

User Function L05Ex14()
    Local aArray := {}
    Local cLetra   := 0
    Local nRepete := 0

    While Len(aArray) <= 12
        cLetra := CHR(RANDOMIZE(97, 122))
        nRepete := ASCAN(aArray, cLetra, 1, Len(aArray))

            If nRepete == 0
                AADD(aArray, cLetra)
            Endif
    Enddo

    MostraArray(aArray)
Return 

Static Function MostraArray(aArray)
    Local cMostra := ''
    Local nCont   := 0

    For nCont := 1 to Len(aArray)
        If nCont < 12
            cMostra += cValToChar(aArray[nCont]) + ', '
        Else 
            cMostra += cValToChar(aArray[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conte�do do Array')
Return
