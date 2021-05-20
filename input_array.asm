.data
array3: .space 8
size3: .word 8
string1: .asciiz "Nhap phan tu: "
string2: .asciiz "Mang cua ban la: "
string3: .asciiz " "
.text
	li $t3, 0               #gán biến đếm $t3 = 0 
	la $a3, array3     	#lưu địa chỉ array3 vào $a3
	lw $s3, size3     	#lưu kích thước array3 vào $s3
nhap:
	beq $t3, $s3, xuat             	#nếu $t3 = $s3 thì rẻ nhánh sang xuất
	la $a0, string1                  
	li $v0, 4
	syscall
	li $v0, 5                       #bắt đầu nhập
	syscall
	sb $v0, ($a3)                   #lưu phần tử vừa nhập vào $a3
	addi $a3, $a3, 1               	#tăng địa chỉ $a3 lên 1
	addi $t3, $t3, 1                #tăng biến đếm $t3 lên 1
	j nhap
xuat:
	li $t3, 0                       #reset biến đếm
           la $a2, array3               #đọc địa chỉ array3 vừa nhập vào $a2
	la $a0, string2
	li $v0, 4
	syscall
loop:
	beq $t3, $s3, exit         	#nếu $t2 = $s3 thì rẻ nhánh sang exit
	lb $a0, ($a2)                	#đọc địa chỉ $a2 vào $a0
	li $v0, 1                       #xuất giá trị integer của $a0
	syscall
	la $a0, string3
	li $v0, 4
	syscall
	addi $a2, $a2, 1           	#tăng địa chỉ $a2 lên 1
	addi $t3, $t3, 1            	#tăng biến đếm $t2 lên 1
	j loop
exit:
	li $v0, 10
	syscall
