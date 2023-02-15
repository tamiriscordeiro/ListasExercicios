#INCLUDE "TOTVS.CH"

//Ler 3 valores, cada um representando as medidas dos lados de um triângulo e escrever se
// formam ou não um triângulo. OBS: para formar um triângulo, o valor de cada lado deve ser menor que
// a soma dos outros 2 lados.

User Function EhTriangulo()

    local cLadoA    := ""
    local nLadoA    := 0
    local cLadoB    := ""
    local nLadoB    := 0
    local cLadoC    := ""
    local nLadoC    := 0

        cLadoA := FwInputBox('Digite o primeiro lado', cLadoA)
            nLadoA := val(cLadoA)
        
        cLadoB := FwInputBox('Digite o segundo lado', cLadoB)
            nLadoB := val(cLadoB)

        cLadoC := FwInputBox('Digite o terceiro lado', cLadoC)
            nLadoC := val(cLadoC)

        if (nLadoA < (nLadoB + nLadoC)) .AND. (nLadoB < (nLadoA + nLadoC)) .AND.(nLadoC < (nLadoA + nLadoB))
            FwAlertSuccess('Os lados informados formam um triângulo!')
        else
            FwAlertError('Os lados informados não formam um triângulo!')
        endif
Return
