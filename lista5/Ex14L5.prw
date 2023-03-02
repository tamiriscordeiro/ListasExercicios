// 14 – Carregar um array com 12 caracteres gerados aleatoriamente (randômicos).
// Serão válidos apenas caracteres que representem letras minúsculas (de “a” até “z”). 
// A carga do array deverá ser feita através de uma função estática que é chamada automaticamente 
// no programa principal. Os caracteres NÃO podem se repetir. No final, exibir o vetor gerado.
// Obs: A exibição deverá ser feita função estática.

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

    FwAlertSuccess(cMostra, 'Conteúdo do Array')
Return
