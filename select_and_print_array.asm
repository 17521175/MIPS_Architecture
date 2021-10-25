.data
array1: 	.word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1: 		.word 10
array2: 	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2: 		.word 16
array3: 	.space 32
size3: 		.word 8
Mang: 		.asciiz "Nhap mang can lay du lieu(1,2,3) : "
Ktra: 		.asciiz "Mang k hop le, hay nhap lai \n "
Phantu1: 	.asciiz "Nhap vi tri phan tu (1->10) : "
Phantu2: 	.asciiz "Nhap vi tri phan tu (1->16) : "
Phantu3: 	.asciiz "Nhap vi tri phan tu (1->8) : "
Xuat:		.asciiz "Phan tu co gia tri la : "
Space: 		.asciiz " "
Breakrow: 	.asciiz " \n"
	
.text
main:	
Nhapmang:
	la $a0, Mang
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	addi $t1, $zero, 1
	addi $t2, $zero, 2
	addi $t3, $zero, 3
	slt $t0, $t3, $v0
	bne $t0, $zero, Nhaplaimang
	beq $v0, $t1, Mang1
	beq $v0, $t2, Mang2
	beq $v0, $t3, Mang3
Nhaplaimang:
	la $a0, Ktra
	li $v0, 4
	syscall
	j Nhapmang
Mang1:
	la $a0, Phantu1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	la $t0, array1		#lấy địa chỉ của mảng 1 <=> i (i=0)
	subi $v0, $v0, 1
	sll $t1, $v0, 2		#dịch trái 2 bit <=> nhân với 4, vì mỗi word cách nhau 4 byte
	add $t2, $t0, $t1	#địa chỉ đầu mảng + vị trí v0 = phần tử ở vị trí v0 mảng 1
	la $a0, Xuat
	li $v0, 4
	syscall
	lw $a0, ($t2)
	li $v0, 1
	syscall
	j End

Mang2:
	la $a0, Phantu2
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	la $t0, array2		#lấy địa chỉ của mảng 2 <=> i (i=0)
	subi $v0, $v0, 1
	sll $t1, $v0, 2		#dịch trái 2 bit <=> nhân với 4, vì mỗi word cách nhau 4 byte
	add $t2, $t0, $t1	#địa chỉ đầu mảng + vị trí v0 = phần tử ở vị trí v0 mảng 2
	la $a0, Xuat
	li $v0, 4
	syscall
	lw $a0, ($t2)
	li $v0, 1
	syscall
	j End

Mang3:
	la $t0, array2		#lấy địa chỉ của mảng 2 <=> i (i=0)
	lw $a0, size2		#lấy nội dung trong biến size2
	sll $t1, $a0, 2		#dịch trái 2 bit <=> nhân với 4, vì mỗi word cách nhau 4 byte
	add $t2, $t0, $t1	#địa chỉ đầu mảng + size của mảng = địa chỉ phần tử cuối mảng 2
	la $t3, array3		#lấy địa chỉ của mảng 3 <=> i (i=0)
	lw $a0, size3		#lấy nội dung trong biến size3
	sll $t4, $a0, 2		#dịch trái 2 bit <=> nhân với 4, vì mỗi word cách nhau 4 byte
	add $t5, $t3, $t4	#địa chỉ đầu mảng + size của mảng = địa chỉ phần tử cuối mảng 3
	
	subi $t2, $t2, 4	#size2 - 1
Loop: 	lw $a0, ($t0)		# <=> arrray2[i] 
	subi $t2, $t2, 4	#(size2 -1) - i
	lw $a1, ($t2)		# <=> arrray2[size2 - 1 - i]
	add $a0, $a0, $a1	# <=> array2[i] + array2[size2 - 1 - i]
	sw $a0, 0($t3)		#lưu vào array3[i]
	addi $t3, $t3, 4	#địa chỉ phần tử tiếp theo trong mảng 3 <=> i++
	slt $t6, $t3, $t5	
	beq $t6, $zero,Check	#t6=1 <=> đủ 8 phần tử trong array3 sẽ out loop
	addi $t0, $t0, 4	#địa chỉ phần tử tiếp theo trong mảng 2 <=> i++
	slt $t7, $t0, $t2
	bne $t7, $zero, Loop	#t7=1 <=> i < size2, tiếp tục loop
Check:
	la $a0, Phantu3
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	la $t0, array3		#lấy địa chỉ của mảng 3 <=> i (i=0)
	subi $v0, $v0, 1
	sll $t1, $v0, 2		#dịch trái 2 bit <=> nhân với 4, vì mỗi word cách nhau 4 byte
	add $t2, $t0, $t1	#địa chỉ đầu mảng + vị trí v0 = phần tử ở vị trí v0 mảng 3
	la $a0, Xuat
	li $v0, 4
	syscall
	lw $a0, ($t2)
	li $v0, 1
	syscall
	j End
	
	
	
end: 	
