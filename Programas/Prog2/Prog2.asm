 DEVICE NOSLOT64K
 SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

 ORG 0000H

 LD SP, 0FFFH
 LD A, 00FFH
 
loop:
 OUT (01H), A       ; 12 STATES
 XOR 00FFH          ; 7 STATES
 LD B, 00FFH        ; 7 STATES (60H - 96D = 100mS) (00FFH = 526ms)
 CALL delay         ; 17 STATES
 JP loop            ; 10 STATES

delay:              ; 1 VEZ? 59+4101 STATES(14,8us+1,03ms=1,045ms) 2 VEZES? 59+39+4101(1,05ms)
 LD C, 00FFH        ; 7 STATES
 CALL delay2        ; 17 STATES
 DJNZ delay         ; B =! 0 15 STATES,  B=0 8 STATES
 RET                ; 10 STATES

delay2:             ; 256 VEZES? 4080+21 STATES = 4101 STATES(1,03ms)
 DEC C              ; 4 STATES
 JR NZ, delay2      ; SATISFEITO? 12 STATES(Z=0),  SENAO 7 STATES(Z=1)
 RET                ; 10 STATES
 
 HALT

 ; delay  10 VEZES? (10,5ms)
 ; delay  97 VEZES? (100,4ms)
 ; delay  484 VEZES? (500,0ms)