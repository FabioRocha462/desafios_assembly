.data
MsgUser1: .asciiz "Digite o primeiro valor"
MsgUser2: .asciiz "Digite outro numero"
.text
la $a0, MsgUser1
  jal imprimirString #lendo o primeira entrada
  jal lerInteiro
  
  move $t0,$v0
  
  la $a0, MsgUser2
  jal imprimirString #lendo a segunda entrada
  jal lerInteiro
  
  move $t1,$v0
  
  bgt $t1,$t0, imprimirResultado#verificando se o primeiro n�mero � maior que o segundo
  blt $t1,$t0 imprimirResultado2#caso a verifica��o anterior seja falsa, verifico se o primeiro � maior que o segundo
  syscall 
  

  
 lerInteiro:
        li $v0, 5 #fun��o para ler um inteiro
        syscall 
        jr $ra
 imprimirString:
        li $v0,4
        syscall #fun��o para mostrar strings
        jr $ra    
   imprimirResultado:
   li $v0,1
  move $a0, $t1#passando o valor para a tela
  syscall
  #encerrando o programa caso a condi��o seja verdadeira
  li $v0,10
  syscall 
  
  
  imprimirResultado2:
  li $v0,1
  move $a0,$t0 #m�todo que � executado na segunda condi��o
  syscall 
  
  
  
