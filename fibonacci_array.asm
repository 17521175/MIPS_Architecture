.data
NhapFibo: .asciiz "nhap so luong phan tu Fibonacci: "
XuatFibo: .asciiz "Cac phan tu Fibonacci la : "
KhongFibo: .asciiz "Khong co gia tri Fibinacci nao"
Breakline: .asciiz "\n"
Space : .asciiz " "
main:
	.text
	li $v0,4			    #syscall xuất chuỗi "NhapFibo"			
	la $a0,NhapFibo
	syscall
	li $v0,5
	syscall
	add $t1, $v0, $zero
	li $v0,4		
	la $a0,Breakline
	syscall
	
	jal fibo
	
	j exit 

fibo:

	beq $t1, $zero, nofibo	#Xét điều kiện nếu số vừa nhập bằng 0 thì out
	
	li $v0,4			    #syscall xuất chuỗi "XuatFibo"	
	la $a0,XuatFibo
	syscall
	
	addi $s0, $0, 1
	addi $sp, $sp, -8		#Khởi tạo stack 2 giá trị
	sw $s0, 0($sp)
	sw $0, 4($sp)
	
Loopfibo:
	lw $s0, 0($sp)		    #Chuyển số thứ nhất trong chuỗi Fibo ra 
	lw $s1, 4($sp)		    #Chuyển số thứ hai trong chuỗi Fibo ra
	add $a0, $s0, $s1		#Cộng 2 số để ra được số thứ 3 trong chuỗi 
	sw $s1, 0($sp)		    #Lưu lại số thứ 2 thành số thứ nhất cho lần cộng kế tiếp
	sw $a0, 4($sp)		    #Lưu lại số thứ 3 thành số thứ hai cho lần cộng kế tiếp
	li $v0, 1
	syscall
	li $v0,4		
	la $a0,Space
	syscall
	subi $t1, $t1, 1		    #Trừ số đã nhập đi 1, tạo giới hạn vòng lặp
	bne $t1, $zero, Loopfibo	#Xét số đã nhập đạt ngưỡng 0 chưa, đạt thì out loop
	
	jr $ra

nofibo: 	
	li $v0,4		
	la $a0,KhongFibo
	syscall
	
	jr $ra	

exit:
