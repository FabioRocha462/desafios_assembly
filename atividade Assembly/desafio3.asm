.data
MsgUser1: .asciiz "Digite o primeiro valor"
MsgUser2: .asciiz "Digite outro numero"
MsgUser3: .asciiz "Digite mais um n�mero"
.text
#l�gica
la $a0, MsgUser1
  jal imprimirString #lendo o primeira entrada
  jal lerInteiro
  
  move $t0,$v0
  
la $a0, MsgUser2
  jal imprimirString #lendo a segunda entrada
  jal lerInteiro
  
  move $t1,$v0  
  
la $a0, MsgUser3
  jal imprimirString #lendo a terceira entrada
  jal lerInteiro
  
  move $t2,$v0  

add $s0,$t0,$t1
add $s1,$s0,$t2

move $t4,$v0

jal imprimirResultado


#fun��es que irei utilizar
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
  move $a0, $s1 #passando o valor para a tela
  syscall
  #encerrando a execu��o
  li $v0,10
  syscall            