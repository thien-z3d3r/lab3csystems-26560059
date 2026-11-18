# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 1 - Calling and returning with jal and jr $ra (sep and stars procedures)

.data
title:    .asciiz "SCORE REPORT\n"
endMsg:   .asciiz "END\n"
line:     .asciiz "----------\n"
starLine: .asciiz "**********\n"

.text
.globl main
main:
    jal  stars              # print top star line
    li   $v0, 4
    la   $a0, title
    syscall
    jal  sep                # print separator line
    li   $v0, 4
    la   $a0, endMsg
    syscall
    jal  stars              # print bottom star line
    li   $v0, 10
    syscall

# sep(): no arguments, no return value; prints a dashed separator line
sep:
    li   $v0, 4
    la   $a0, line
    syscall
    jr   $ra                # return to the caller

# stars(): no arguments, no return value; prints a star separator line
stars:
    li   $v0, 4
    la   $a0, starLine
    syscall
    jr   $ra                # return to the caller
