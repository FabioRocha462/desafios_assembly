.data
MsgUser1: .asciiz "Digite um valor"
MsgUser2: .asciiz "Digite outro numero"
.text
#l�gica
la $a0, MsgUser1
  jal imprimirString #lendo o primeira entrada
  jal lerInteiro
  
  move $t0,$v0
  
la $a0, MsgUser2
  jal imprimirString #lendo o primeira entrada
  jal lerInteiro  
  
  move $t1,$v0
  
  div $t0, $t1 # dividindo o valor dos registradores
  
  mfhi $s1 #colocando o valor menos significativo em $s1
  
  li $v0, 1
move $a0,$s1 #mostrando o resto da divis�o na tela
syscall
#finalizando
li $v0,10
  syscall

#fun��es
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
  move $a0, $t1         