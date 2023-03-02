// 13 – Carregar um Array com 50 caracteres gerados aleatoriamente (randômicos). Serão válidos
// apenas caracteres que representem letras maiúsculas (de “A” até “Z”). A carga do array
// deverá ser feita através de uma função estática que é chamada automaticamente no programa
// principal. Obs: Os caracteres podem se repetir.

#INCLUDE 'TOTVS.CH'
    
User Function Ex13L5()
    local aVetor := {}

    PreencheVet(aVetor)

    FwAlertInfo(ArrTokStr(aVetor, " , "), 'Vetor')

Return 

Static Function PreencheVet(aVetor)     
    local nI := 0

    FOR nI := 1 TO 50
        aAdd(aVetor, (CHR(Randomize(65 , 90))))
    NEXT 

Return
