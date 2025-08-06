.section .text
.global load 
.type load, @function

load: 
add  a4, a0, zero//a4=0
add  a2, a0, a1//a2=10
add  a3, a0, zero//a3=0

loop:
add  a4, a3, a4
addi a4, a3, 1//increment intermediate
blt  a3, a2, loop//branch if less than
add  a0, a4, zero
ret