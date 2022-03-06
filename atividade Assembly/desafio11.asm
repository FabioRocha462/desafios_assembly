.data
vir: .asciiz "," #virgula para separar a parte inteira da fracuonada que nesse caso foi o exemplo
.text
li $t0,32 #colocando o valor diretamente no registrador $t0

li $t1,5 #colocando o valor diretamente no registrador

div $t0, $t1 # dividindo o valor dos registradores

mflo $s0 #colocando o valor mais significativo em $s0
mfhi $s1 #colocando o valor menos significativo em $s1

li $v0, 1
move $a0,$s0 #mostrando o valor mais significativo na tela
syscall

la $a0, vir
li $v0,4 #mostrando a vírgula na tela
syscall

li $v0, 1
move $a0, $s1 #mostrando o valor menos significativo na tela
syscall
