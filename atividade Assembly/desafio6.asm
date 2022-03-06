.data
#usando um vetor
MsgUser1: .asciiz "Digite o valor"
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
  beq $t1,$zero,com #na primeira rodada do vetor o primeiro número que entrar é o maior de todos, assim temos por onde começar a comparar
  lw $t4, myArray($t1)#recuperando o valor da posição do array para fazermos comparações
  bge $t4,$t3, com #caso o número da nova entrada seja maior que o maior guardado, troca o valor do registrador que guarda o maior número

  addi $t1,$t1,4#incremento o índice do Array
  j loop #pulo pro loop
  
  saiDoLoop: #saída do loop
  
        li $v0,1
        move $a0, $t3#passando o valor para a tela do maior número digitado
        syscall
  
       #encerrando o programa 
        li $v0,10
        syscall 
 #minhas funções

com:
  lw $t3, myArray($t1)#caso o valor novo que entrou seja maior que o guardado em $t3, ele troca pelo maior valor
  jal pivo #pulo pra minha função pivô
  
  pivo: 
  addi $t1,$t1,4 #função que incrementa caso o número novo seja maior que o atual maior
  jal loop #pulo pro loop para seguir o fluxo
  


   
 
       
 
  
      	
	
	