
.text

li $t1,5 #colocando o valor de 5 no registrador $t1
li $t0,6 #colocando o valor de 6 no registrador $t0

sub $s0,$t1,$t0 #multiplicando os valores em $t1 e $t0 e guardando em 

li $v0,1
move $a0,$s0
syscall
