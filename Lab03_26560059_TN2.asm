# Name: Huynh Khanh Thien
# Student ID: 26560059
# Purpose: Experiment 2 - Arguments and return values (clamp(x, lo, hi) procedure)

.text
.globl main
main:
    li   $v0, 5                 # read an integer x into $v0
    syscall
    add  $a0, $v0, $zero        # argument 1: x
    addi $a1, $zero, 0          # argument 2: lo = 0
    addi $a2, $zero, 100        # argument 3: hi = 100
    jal  clamp
    add  $a0, $v0, $zero        # print the result
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall

# clamp(x = $a0, lo = $a1, hi = $a2): returns x limited to [lo, hi] in $v0
clamp:
    slt  $t0, $a0, $a1          # $t0 = 1 if x < lo
    beq  $t0, $zero, clamp_check_hi
    add  $v0, $a1, $zero        # result = lo
    jr   $ra
clamp_check_hi:
    slt  $t0, $a2, $a0          # $t0 = 1 if hi < x
    beq  $t0, $zero, clamp_in_range
    add  $v0, $a2, $zero        # result = hi
    jr   $ra
clamp_in_range:
    add  $v0, $a0, $zero        # result = x
    jr   $ra
