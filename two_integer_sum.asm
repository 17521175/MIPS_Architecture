data
var1 : 	.word
var2 : 	.word
string1: .asciiz "Xin moi ban nhap so thu 1: \n"
string2: .asciiz "Xin moi ban nhap so thu 2: \n"
string3: .asciiz "Ket qua cua ban la: \n"
.text
main :
	 #Nhap so lan thu 1
	 li $v0, 4
	 la $a0, string1
	 syscall
	 li $v0, 5
	 syscall
	 add $t0, $v0, $zero               #luu so vua nhap vao $t0

	 #Nhap so lan thu 2
	 li $v0, 4
	 la $a0, string2
	 syscall
	 li $v0, 5
	 syscall
	 add $t1, $v0, $zero               #luu so vua nhap vao $t1

	 #Thuc hien phep cong 2 so
	 add $t2, $t0, $t1

	 #Xuat ket qua
	 li $v0, 4
	 la $a0, string3
	 syscall
	 add $a0, $t2, $zero
	 li $v0, 1
	 syscall
