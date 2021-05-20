.data
myArray: .space 30
string1: .asciiz "Nhap n: "
string2: .asciiz "nhap phan tu: "
string3: .asciiz "\nMax: "
string4: .asciiz "\nMin: "
.text
	la $a0, string1a
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t6, $v0         #nhap n
	li $v0, 4
	
	
	li $t0, 0 		#i = 0
	li $s0, 0 		#biến đếm $s0 = 0
	
loop:
	la $a0, string2
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, myArray($t0)          #lưu phần tử vừa nhập vào vị trí của mảng
	addi $t0, $t0, 4
	addi $s0, $s0, 1
	beq $s0, $t6, cal
	j loop

cal:
	li $t0, 0			#i
	lw $s0, myArray($t0) 	#max = A[0]
	move $s2, $s0 		#min = A[0]
	li $t1, 1 			#bắt đầu đếm từ vị trí 1
	
sum:
	beq $t1, $t6, exit
	add $t0, $t0, 4
	lw $s1, myArray($t0)           #$s1=myArray[i]
	bge $s0, $s1, min
	move $s0, $s1
min:
	ble $s2, $s1, next
	move $s2, $s1
next:	
	add $t1, $t1, 1
	j sum
exit:
	li $v0, 4
	la $a0, string3
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, string4
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	
