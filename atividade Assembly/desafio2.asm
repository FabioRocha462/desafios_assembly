.text

li $t0, 40 #colocando o valor 40 no registrador $t0

li $t1,30 #colocando o valpr 30 no registrador $t1

add $s1,$t0,$t1 #somando os valores dos registradores $t0 e $t1 e colocando no registrador $s0

#mostrado o resultado na tela
li $v0,1
move $a0, $s1
syscall

