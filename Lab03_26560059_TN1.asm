# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 1 - Calling and returning with jal and jr $ra (sep and stars)

.data
title:    .asciiz "SCORE REPORT\n"
endMsg:   .asciiz "END\n"
line:     .asciiz "----------\n"
starLine: .asciiz "**********\n"

.text
.globl main
main:
    jal  stars
    li   $v0, 4
    la   $a0, title
    syscall
    jal  sep
    li   $v0, 4
    la   $a0, endMsg
    syscall
    jal  stars
    li   $v0, 10
    syscall

sep:
    li   $v0, 4
    la   $a0, line
    syscall
    jr   $ra

stars:
    li   $v0, 4
    la   $a0, starLine
    syscall
    jr   $ra
