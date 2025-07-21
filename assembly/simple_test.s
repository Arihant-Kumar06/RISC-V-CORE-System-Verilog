.global _start
.section .text

_start: 
    addi x1, x0, 5
    addi x2,x0, 10
    add x3, x1, x2
    jal x0, _start