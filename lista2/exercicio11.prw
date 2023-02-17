// 11 - Elaborar um programa que exiba na tela, automaticamente, 50 valores gerados
// aleatoriamente, entre 10 e 99. Fazer 2 vers�es desta solu��o:
// o 1a - Utilizando For
// o 2a � Utilizando While

#INCLUDE "TOTVS.CH"

User Function Aleatorio()
    Local aEscolha := {'For', 'While'}

    //Aqui o usu�rio poder� escolher com qual Loop os n�meros ser�o gerados.
    aEscolha := Aviso('Escolha a fun��o que o programa utilizar�', 'Choose', aEscolha, 1)

    If aEscolha == 1
        FunFor()
    Else
        FunWhile()
    Endif
Return 

Static Function FunFor()
    Local cNum  := ''
    Local nCont := 1

    //Estrutura de Loop de 1 a 50 utilizando For e concatenando os n�meros na vari�vel cNums.
    For nCont := 1 to 50
        If nCont < 50
            cNum += cValToChar(RANDOMIZE(10, 99)) + ', '
        Else 
            cNum += cValToChar(RANDOMIZE(10, 99)) + '.'
        Endif
    Next

    FwAlertSuccess('O n�meros gerados foram: ' + CRLF + cNum)
Return

Static Function FunWhile()
    Local cNum  := ''
    Local nCont := 1

    //Estrutura de Loop de 1 a 50 utilizando While e concatenando os n�meros na vari�vel cNums.
    While nCont <= 50
        If nCont < 50
            cNum += cValToChar(RANDOMIZE(10, 99)) + ', '
        Else 
            cNum += cValToChar(RANDOMIZE(10, 99)) + '.'
        Endif
        nCont++
    End

    FwAlertSuccess('O n�meros gerados foram: ' + CRLF + cNum)
Return
