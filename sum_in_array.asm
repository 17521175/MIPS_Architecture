.data
string1: .space 30
string2: .asciiz "Nhap n: "
string3: .asciiz "Nhap phan tu: "
string4: .asciiz "Mang cua ban la: "
string5: .asciiz " "
string6: .asciiz "Sum: "
string7: .asciiz " \n"
.text
	la $a0, string2
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	li $t1, 0
	la $a1, string1
	move $s1, $v0 

nhap:
	beq $t1, $s1, xuat
	la $a0, string3
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sb $v0, ($a1)
	addi $a1, $a1, 1
	addi $t1, $t1, 1 
	j nhap
	
xuat:
	li $t1, 0                     #reset biến đếm
           la $a2, string1
	la $a0, string4
	li $v0, 4
	syscall
loop:
	beq $t1, $s1, sum
	lb $a0, ($a2)
	li $v0, 1
	syscall
	la $a0, string5
	li $v0, 4
	syscall
	addi $a2, $a2, 1
	addi $t1, $t1, 1
	j loop
sum:
	li $t1, 0                     #reset biến đếm
           li $s3, 0                     #Sum = 0
           la $a3, string1
	la $a0, string7
	li $v0, 4
	syscall
loop_sum:
	beq $t1, $s1, print
	lb $s2, ($a3)
	add $s3, $s3, $s2
	addi $a3, $a3, 1
	addi $t1, $t1, 1
	j loop_sum
print:
	la $a0, string6
	li $v0, 4
	syscall
	move $a0, $s3
	li $v0, 1
	syscall
	j exit
exit:
	li $v0, 10
	syscall

