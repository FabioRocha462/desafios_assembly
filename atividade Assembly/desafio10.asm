#declaraçãço do que vou buscar na memória
.data
var1: .word 5 #criando uma variável do tipo word com o valor 5
var2: .word 7 #Criando uma variavável do tipo word com o valor 7

#codificação
.text
lw $t0,var1 #repassando o valor da variável var1 para o registrador $t0 com a instrução lw
lw $t1,var2 #repassando o valor da variável var2 para o registrador $t1 com a instrução lw

multu     $s0,$t1,$t0 #multiplicando os valores guardados em $t0 e $t1 e guardando em $s0

#mostrando o valor da multiplicação na tela

move $a0,$s0 #levando o valor de $s0 para o registrador $a0 com a instrução move

li $v0,1 #comando para mostrar um inteiro na tela






