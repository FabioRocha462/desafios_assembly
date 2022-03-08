.data
#usando um vetor
MsgUser1: .asciiz "Digite o valor"
esp: .asciiz " "
	myArray:
	.align 2#alinha na posição correta
	.space 12 #criando um array de 3 posições, lembrando que um inteiro ocupa 4B
.text
#logica
  li $t1,0 #indice do vetor
  li $t2,12 #valor para parada
  
  loop:#loop para achar o maior número
  beq $t1,$t2, saiDoLoop#regra para sair do loop
  
   li $v0,4
   la $a0,MsgUser1#mostrando uma mensagem na tela
   syscall 
  
   li $v0, 5  #lendo um inteiro
   syscall 
   
   move $t0,$v0 #passando o valor de $v0 para $t0
   sw $t0, myArray($t1)#setando o valor digitado na posição do Array
   addi $t1,$t1,4#incremento o índice do Array
   j loop
   saiDoLoop:
   #ordenando o vetor
   li $t1,0
   li $t2,12
   loopExterno:#loop externo, para pegar o valor de comparação
     beq $t1,$t2, saiDoLoopExterno#regra para sair do loop 
     addi $t3,$t1,4
     loopInterno:#loop interno para fazer a comparação entre dois valores e fazer a troca, caso seja necessário
     	beq $t3,$t2, saiDoLoopInterno#regra para sair do loop 
     	lw $t4, myArray($t1)
     	lw $t5, myArray($t3)
     	bgt $t4,$t5, com
     	addi $t3,$t3,4
     	j loopInterno
     saiDoLoopInterno:
     	li $t3,0	
     addi $t1,$t1,4
   j loopExterno  
   
   saiDoLoopExterno:
    li $t1,0
    loopImprimi:#loop para imprimir
      beq $t1,$t2, saiDoLoopImprimi
      lw $t3,myArray($t1)
      
     li $v0,1
     move $a0, $t3#passando o valor para a tela
     syscall
      
      li $v0,4
      la $a0,esp
      syscall
      addi $t1,$t1,4
    j loopImprimi
    saiDoLoopImprimi:
      #encerrando a execução
  li $v0,10
  syscall
   #minhas funções
   com:;#função para fazer o swap dos valores, caso a condição de troca seja verdadeira
   move $t6,$t5#passo o valor de $t5 para um registrador auxiliar
   move $t5,$t4#passo o valor de $t4 para $t5
   move $t4,$t6#passo para $t4 o valor recuperado
   sw $t4, myArray($t1) #passo o valor do registrador para  a memória
   sw $t5, myArray($t3) #passo o valor do registrador para a memória
   jal pivo #pulo para o pivo
   
   pivo:
   addi $t3,$t3,4 #função que incrementa caso o número novo seja maior que o atual maior
   jal loopInterno #pulo para loopInterno, escapando de uma parada inesperada
