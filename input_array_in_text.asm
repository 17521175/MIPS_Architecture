.data
string1: .space 30
string2: .asciiz "Nhap n: "
string3: .asciiz "Nhap phan tu: "
string4: .asciiz "Mang cua ban la: "
string5: .asciiz " "
.text
	la $a0, string2
	li $v0, 4
	syscall
	li $v0, 5
	syscall                        	#nhap n
	
	li $t1, 0                      	#biến đếm 1
	la $a1, string1             	#lưu địa chỉ mảng vào $a1
	move $s1, $v0            	#lưu phần tử vừa nhập vào $s1

nhap:
	beq $t1, $s1, xuat       	#nếu $t1 = $s1 thì rẻ nhánh qua xuất
	la $a0, string3
	li $v0, 4
	syscall
	li $v0, 5                       #bắt đầu nhập
	syscall
	sb $v0, ($a1)               	#lưu phần tử vừa nhập vào $a1
	addi $a1, $a1, 1          	#tăng địa chỉ $a1 lên 1
	addi $t1, $t1, 1            	#tăng biến đếm lên 1
	j nhap
	
xuat:
	li $t1, 0                      	#reset biến đếm
        la $a2, string1            	#đọc địa chỉ chuỗi vừa nhập vào $a2
	la $a0, string4
	li $v0, 4
	syscall
loop:
	beq $t1, $s1, exit      	#nếu $t2 = $s1 thì rẻ nhánh qua exit
	lb $a0, ($a2)             	#đọc địa chỉ $a2 vào $a0
	li $v0, 1                    	#xuất giá trị integer trong $a0
	syscall
	la $a0, string5
	li $v0, 4
	syscall
	addi $a2, $a2, 1     		#tăng địa chỉ $a2 lên 1
	addi $t1, $t1, 1      		#tăng biến đếm
	j loop
exit:
	li $v0, 10
	syscall

