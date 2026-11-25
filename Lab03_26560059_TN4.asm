# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 4 - Saving and restoring $s0 on the stack in sum3

.text
.globl main
main:
    addi $s0, $zero, 2
    addi $a0, $zero, 8
    addi $a1, $zero, 7
    addi $a2, $zero, 9
    jal  sum3
    add  $s1, $v0, $zero
    add  $a0, $s0, $zero
    li   $v0, 1
    syscall
    li   $v0, 11
    addi $a0, $zero, 32
    syscall
    add  $a0, $s1, $zero
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall

sum3:
    addi $sp, $sp, -4
    sw   $s0, 0($sp)
    add  $s0, $a0, $a1
    add  $v0, $s0, $a2
    lw   $s0, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
