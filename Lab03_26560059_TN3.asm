# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 3 - Procedures on arrays (sum_array, count_pass, show)

.data
classA:   .word 72, 55, 90, 48, 63, 85, 39, 77, 60, 94
classB:   .word 45, 81, 66, 50, 92, 38, 70, 59
msgA:     .asciiz "Class A total: "
msgB:     .asciiz "Class B total: "
msgPassA: .asciiz "Class A passed: "
msgPassB: .asciiz "Class B passed: "
nl:       .asciiz "\n"

.text
.globl main
main:
    la   $a0, classA
    addi $a1, $zero, 10
    jal  sum_array
    la   $a0, msgA
    add  $a1, $v0, $zero
    jal  show

    la   $a0, classB
    addi $a1, $zero, 8
    jal  sum_array
    la   $a0, msgB
    add  $a1, $v0, $zero
    jal  show

    la   $a0, classA
    addi $a1, $zero, 10
    addi $a2, $zero, 91
    jal  count_pass
    la   $a0, msgPassA
    add  $a1, $v0, $zero
    jal  show

    la   $a0, classB
    addi $a1, $zero, 8
    addi $a2, $zero, 91
    jal  count_pass
    la   $a0, msgPassB
    add  $a1, $v0, $zero
    jal  show

    li   $v0, 10
    syscall

sum_array:
    addi $v0, $zero, 0
    addi $t0, $zero, 0
sum_loop:
    slt  $t1, $t0, $a1
    beq  $t1, $zero, sum_end
    sll  $t2, $t0, 2
    add  $t2, $t2, $a0
    lw   $t3, 0($t2)
    add  $v0, $v0, $t3
    addi $t0, $t0, 1
    j    sum_loop
sum_end:
    jr   $ra

count_pass:
    addi $v0, $zero, 0
    addi $t0, $zero, 0
cp_loop:
    slt  $t1, $t0, $a1
    beq  $t1, $zero, cp_end
    sll  $t2, $t0, 2
    add  $t2, $t2, $a0
    lw   $t3, 0($t2)
    slt  $t1, $t3, $a2
    bne  $t1, $zero, cp_next
    addi $v0, $v0, 1
cp_next:
    addi $t0, $t0, 1
    j    cp_loop
cp_end:
    jr   $ra

show:
    li   $v0, 4
    syscall
    li   $v0, 1
    add  $a0, $a1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr   $ra
