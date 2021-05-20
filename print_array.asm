.data
array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1: .word 10
array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2: .word 16
string1: .asciiz "Mang 1: "
string2: .asciiz "Mang 2: "
string3: .asciiz " "
string4: .asciiz " \n"
.text
	li $t1, 0               #tạo biến đếm cho chuỗi 1
	la $a1, array1     	#lưu địa chỉ chuỗi 1    
	lw $s1, size1      	#lưu kích thước chuỗi 1
	li $t2, 0               #tạo biến đếm cho chuỗi 2
	la $a2, array2       	#lưu địa chỉ chuỗi 2
	lw $s2, size2        	#lưu kích thước chuỗi 2
	la $a0, string1
	li $v0, 4
	syscall
print_array1:
	beq $t1, $s1, newline     	#nếu $t1 = $s1 thì rẻ nhanh sang newline
	lw $a0, ($a1)                  	#đưa địa chỉ của $a1 vào $a0
	li $v0, 1                       #xuất giá trị integer của $a0
	syscall
	la $a0, string3
	li $v0, 4
	syscall
	addi $a1, $a1, 4            	#tăng 4 bit địa chỉ cho a1
	addi $t1, $t1, 1             	#tăng biến đếm 
	j print_array1
newline:
	la $a0, string4
	li $v0, 4
	syscall
	la $a0, string2
	li $v0, 4
	syscall
	j print_array2
print_array2:
	beq $t2, $s2, exit       	#nếu $t2 = $s2 thì rẻ nhanh sang exit
	lb $a0, ($a2)              	#đưa địa chỉ của $a2 vào $a0 (byte)
	li $v0, 1                     	#xuất giá trị integer của $a0
	syscall
	la $a0, string3
	li $v0, 4
	syscall
	addi $a2, $a2, 1
	addi $t2, $t2, 1
	j print_array2
exit:
	li $v0, 10                	#kết thúc chương trình
	syscall



