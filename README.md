# MIPS
1	  add	    | - Cộng giá trị trong 2 thanh ghi và lưu vào 1 thanh ghi
    ________|      Có cờ báo tràn số	add  $4, $5, $9
2	  addi    |	- Cộng giá trị trong 1 thanh ghi với 1 hằng số và lưu vào 1 thanh ghi
    ________|      Có cờ báo tràn số	addi $1, $2, 12
3	  addu    |	- Cộng giá trị không dấu trong 2 thanh ghi và lưu vào 1 thanh ghi
    ________|      Không có cờ bào tràn số	addu $1, $2, $3
4	  addiu   |	- Cộng giá trị không dấu trong 2 thanh ghi và lưu vào 1 thanh ghi
    ________|     Không có cờ bào tràn số	addiu $1, $2, 12
5	  sub	    | - Trừ giá trị trong 2 thanh ghi và lưu vào 1 thanh ghi
    ________|     Có cờ báo tràn số	sub $1, $2, $3
6	  subu    |	- Trừ giá trị không dấu trong 2 thanh ghi và lưu vào 1 thanh ghi
    ________|     Không có cờ bào tràn số	subu $1, $2, $3 
7	  and	    | - Nhân logic giá trị trong 2 thanh ghi và lưu vào 1 thanh ghi	and $1, $2, $3
    ________|
8	  andi    |	- Nhân logic giá trị trong 1 thanh ghi với 1 hằng số và lưu vào 1 thanh ghi	andi $1, $2, 12
9	  or	    | - Cộng logic giá trị trong 2 thanh ghi và lưu vào 1 thanh ghi	or $1, $2, $3
10	nor     |	- Cộng bù logic giá trị trong 2 thanh ghi và lưu vào 1 thanh ghi	or $1, $2, $3 
11	lw	    | - Đọc địa chỉ từ 1 thanh ghi và lưu vào 1 thanh ghi	lw $1, 4($2)
12	sw	    | - Lưu địa chỉ từ 1 thanh ghi và lưu vào 1 thanh ghi	sw $1, 4($2)
13	slt	    | - So sánh giá trị trong 2 thanh ghi, nếu $2 bé hơn $3 thì $1 có giá trị bằng 1. Ngược lại $1 có giá trị bằng 0	slt $1, $2, $3 
14	slti    |	- So sánh giá trị trong 1 thanh ghi với 1 hằng số, nếu $2 bé hơn hằng số thì $1 có giá trị bằng 1. Ngược lại $1 có giá trị bằng 0	slti $1, $2, 12
15	sltu    |	- So sánh giá trị không dấu trong 2 thanh ghi, nếu $2 bé hơn $3 thì $1 có giá trị bằng 1. Ngược lại $1 có giá trị bằng 0	slt $1, $2, $3 
16	sltiu   |	- So sánh giá trị không dấu trong 1 thanh ghi với 1 hằng số, nếu $2 bé hơn hằng số thì $1 có giá trị bằng 1. Ngược lại $1 có giá trị bằng 0	slti $1, $2, 12
17	syscall |	- Lời gọi hệ thống, làm gián đoạn chương trình, và thực thi các dịch vụ tương ứng với giá trị từ 1-56 trong thanh ghi $v0	li $v0, 1
            |     add $a0, $t0, $zero
    ________|     syscall_________________________________________________________________________________________________________________________________________________
