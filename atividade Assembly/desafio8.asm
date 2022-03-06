.data
MsgUser1: .asciiz "Digite o primeiro valor"
MsgUser2: .asciiz "Digite outro numero"
.text
#lógica
la $a0, MsgUser1
  jal imprimirString #lendo o primeira entrada
  jal lerInteiro
  
  move $t0,$v0

    
la $a0, MsgUser2
  jal imprimirString #lendo a segunda entrada
  jal lerInteiro
  
  move $t1,$v0 
 
   sub $s0,$t1,$t0    
   bgt $s0,$zero, imprimirResultado #verifica se o resultado é positivo
   
   blt $s0,$zero,contrario # caso a primeira condição seja negativa, executa este comando
   
   jal imprimirResultado




#funções que irei utilizar
 lerInteiro:
        li $v0, 5 #função para ler um inteiro
        syscall 
        jr $ra
 imprimirString:
        li $v0,4
        syscall #função para mostrar strings
        jr $ra 
  contrario:
      sub $s0,$t0,$t1 #executa o primeiro menos o segundo
            
 imprimirResultado:
  li $v0,1
  move $a0, $s0 #passando o valor para a tela
  syscall
  #encerrando a execução
  li $v0,10
  syscall               