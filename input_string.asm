.data 
string1: .asciiz "Xin moi ban nhap chuoi: \n"    #tao chuoi 1
string2: .asciiz                                 #tao chuoi 2
.text
main:   
	li $v0, 4                  #lenh in chuoi
        la $a0, string1            #luu dia chi chuoi string1 vao $a0
        syscall                    #in noi dung chuoi string1 ra man hinh
        li $v0, 8	           #lenh doc chuoi
	la $a0, string2            #luu dia chi chuoi string2 vao $a0
	li $a1, 200                #tao kich thuoc cho chuoi 
	syscall                    #nhap chuoi string2
	li $v0, 4                  #lenh in chuoi
	syscall                    #in noi dung chuoi string2 ra man hinh
