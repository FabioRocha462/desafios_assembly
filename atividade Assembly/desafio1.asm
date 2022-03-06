.data
var1: .word 10#Criando uma variável e aplicando o valor 10"

.text
lw $t1,var1 #pegango o valor da memória e passando para o registrador"

add $s0,$zero,$t1 #passando o valor da variável para o registrador indicado para mostrar na tela"

li $v0,1
move $a0,$s0 #esquema de código para mostrar na tela"
syscall