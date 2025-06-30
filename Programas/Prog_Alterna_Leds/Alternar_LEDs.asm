 .org 00h

portC = 03h
portB = 02h
portA = 01h

  LD SP, 0FFFh

  LD A, 01010101b

loop:
 OUT (portC), A
 XOR 11111111b
 LD B, 10
 CALL delayA
 JP loop

delayA:
 DJNZ delayA

 .end