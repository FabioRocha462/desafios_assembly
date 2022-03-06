.data
#usando um vetor
MsgUser1: .asciiz "Digite o valor"
	myArray:
	.align 2#alinha na posi��o correta
	.space 12 #criando um array de 3 posi��es, lembrando que um inteiro ocupa 4B
.text
#logica

  li $t1,0 #indice do vetor
  li $t2,12 #valor para parada
 
  
  loop:#loop para achar o maior n�mero
  beq $t1,$t2, saiDoLoop#regra para sair do loop
  
   li $v0,4
   la $a0,MsgUser1#mostrando uma mensagem na tela
   syscall 
  
   li $v0, 5  #lendo um inteiro
   syscall 
   
   move $t0,$v0 #passando o valor de $v0 para $t0
  sw $t0, myArray($t1)#setando o valor digitado na posi��o do Array
  beq $t1,$zero,com #na primeira rodada do vetor o primeiro n�mero que entrar � o maior de todos, assim temos por onde come�ar a comparar
  lw $t4, myArray($t1)#recuperando o valor da posi��o do array para fazermos compara��es
  bge $t4,$t3, com #caso o n�mero da nova entrada seja maior que o maior guardado, troca o valor do registrador que guarda o maior n�mero

  addi $t1,$t1,4#incremento o �ndice do Array
  j loop #pulo pro loop
  
  saiDoLoop: #sa�da do loop
  
        li $v0,1
        move $a0, $t3#passando o valor para a tela do maior n�mero digitado
        syscall
  
       #encerrando o programa 
        li $v0,10
        syscall 
 #minhas fun��es

com:
  lw $t3, myArray($t1)#caso o valor novo que entrou seja maior que o guardado em $t3, ele troca pelo maior valor
  jal pivo #pulo pra minha fun��o piv�
  
  pivo: 
  addi $t1,$t1,4 #fun��o que incrementa caso o n�mero novo seja maior que o atual maior
  jal loop #pulo pro loop para seguir o fluxo
  


   
 
       
 
  
      	
	
	