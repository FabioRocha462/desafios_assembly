.data
MsgUser1: .asciiz "Digite um valor"
esp: .asciiz " "
go: .asciiz "Go!"
.text
#l�gica
la $a0, MsgUser1
  jal imprimirString #lendo o primeira entrada
  jal lerInteiro
  
  move $t0,$v0 #setaando o valor no registrador
  li $t1,1 #registrador de compara��o
  
   laco:
   bgt $t1,$t0, caifora
   
   li $v0,1
   move $a0,$t0
   syscall
   
   li $v0,4
   la $a0,esp
   syscall
   
   addi $t0,$t0,-1
   j laco
   caifora:
  

  
  la $a0, go
  jal imprimirString 
  
   #encerrando a execu��o
  li $v0,10
  syscall 
#fun�oes que irei utilizar
lerInteiro:
        li $v0, 5 #fun��o para ler um inteiro
        syscall 
        jr $ra
 imprimirString:
        li $v0,4
         syscall
        jr $ra
  imprimirResultado:
  li $v0,1
  move $a0, $t1 