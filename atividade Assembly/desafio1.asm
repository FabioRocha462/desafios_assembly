.data
var1: .word 10#Criando uma vari�vel e aplicando o valor 10"

.text
lw $t1,var1 #pegango o valor da mem�ria e passando para o registrador"

add $s0,$zero,$t1 #passando o valor da vari�vel para o registrador indicado para mostrar na tela"

li $v0,1
move $a0,$s0 #esquema de c�digo para mostrar na tela"
syscall