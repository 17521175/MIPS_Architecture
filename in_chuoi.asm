.data                                                               	#vung khai bao du lieu
string1: .asciiz "Chao ban! Ban la sinh vien nam thu may? \n"  		#tao chuoi 1
string2: .asciiz "Hihi, minh la sinh vien nam thu 1 ^-^ \n"         	#tao chuoi 2
.text
main:   
	li $v0, 4                          #lenh in chuoi
        la $a0, string1                    #luu dia chi chuoi string1 vao $a0                                                              
        syscall                            #in noi dung chuoi string1 ra man hinh   
        la $a0, string2                    #luu dia chi chuoi string 2 vao $a0
 	syscall                            #in noi dung chuoi string 2 ra man hinh 
