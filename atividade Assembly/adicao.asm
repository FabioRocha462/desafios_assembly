.data
MsgUser1: .asciiz "Digite o primeiro valor"
MsgUser2: .asciiz "Digite outro numero"
.text
  la $a0, MsgUser1
  jal imprimirString
  jal lerInteiro
  
  move $t1,$v0
  
  la $a0, MsgUser2
  jal imprimirString
  jal lerInteiro
  
  move $t2,$v0

  add $a1,$t1,$t2
  li $v0,1
  move $a0, $a1
  syscall
 
  
  
 lerInteiro:
        li $v0, 5
        syscall 
        jr $ra
 imprimirString:
        li $v0,4
        syscall 
        jr $ra        
  end:
       li $v0,10
       syscall         
