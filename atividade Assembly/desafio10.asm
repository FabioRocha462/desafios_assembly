#declara���o do que vou buscar na mem�ria
.data
var1: .word 5 #criando uma vari�vel do tipo word com o valor 5
var2: .word 7 #Criando uma variav�vel do tipo word com o valor 7

#codifica��o
.text
lw $t0,var1 #repassando o valor da vari�vel var1 para o registrador $t0 com a instru��o lw
lw $t1,var2 #repassando o valor da vari�vel var2 para o registrador $t1 com a instru��o lw

multu     $s0,$t1,$t0 #multiplicando os valores guardados em $t0 e $t1 e guardando em $s0

#mostrando o valor da multiplica��o na tela

move $a0,$s0 #levando o valor de $s0 para o registrador $a0 com a instru��o move

li $v0,1 #comando para mostrar um inteiro na tela






