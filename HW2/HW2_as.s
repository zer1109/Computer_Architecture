# a1:pointer holds jewels
# a2:pointer holds stones
# s1:
.data
jewels1:
    .string "aAc"
    .byte 0 # end of string
stones1:
    .string "aAAbbcbb"
    .byte 0 # end of string
#array:
    #.dword 0 
.text
main:
    addi t6,t6,1
    la   s1, jewels1
    la   s2, stones1
    addi a1, s1, 0
    addi a2, s2, 0
    jal  ra, numJewelsInStones
    addi    x17,x0,10
    ecall                  # program stop
numJewelsInStones:
    addi sp, sp, -132
    addi t5,sp,0
    sw   ra, 128(sp)
    #addi s1, a1, 0
if_jewels:
    lb  t0,0(s1) 
    beq t0,x0,if_stones
    add sp,sp,t0
    sb t6,0(sp)
    addi sp,t5,0
    addi s1,s1,1
    j if_jewels
if_stones:
    lb  t1,0(s2)
    beq t1,x0,end
    add sp,sp,t1
    lb  t4,0(sp)
    addi sp,t5,0
    #bne t4,t6,counter
    beq t4,t6,counter
    addi s2, s2, 1
    j if_stones
counter:
    addi a3,a3,1
    addi s2, s2, 1
    j if_stones
end:
    addi a0,a3,0
    li a7,1
    ecall
    la a0,10
    li a7,11
    ecall
    addi sp,t5,0
    lw s1, 128(sp)
    addi sp, sp, 132
    ret