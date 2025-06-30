 DEVICE NOSLOT64K
 SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

; DEMO Z80-Didático

 ORG 0000H

 LD SP, 0FFFH

carrega_tabela:
 LD HL, tabela
 CALL loop
 JP carrega_tabela
 LD A, 00H

loop:
 LD A, (HL)
 INC HL
 OUT (01H), A
 LD B, 00FFH
 XOR 00H
 LD E, A

 LD D, 07H
 CALL loop_esq
 CALL delay

 CALL delay
 
 LD D, 07H
 CALL loop_dir
 CALL delay

 LD A, E
 JR NZ, loop
 RET

loop_esq:
        OUT (02H), A
        LD C, 02H
        CALL delay
        RLCA
        DEC D
        JR NZ, loop_esq
        RET
        
loop_dir:
        OUT (02H), A
        LD C, 02H
        CALL delay
        RRA
        DEC D
        JR NZ, loop_dir
        RET 
        
 
delay:              ; 1 VEZ? 59+4101 STATES(14,8us+1,03ms=1,045ms) 2 VEZES? 59+39+4101(1,05ms)
 LD C, 00FFH        ; 7 STATES
 CALL delay2        ; 17 STATES
 DJNZ delay         ; B =! 0 15 STATES,  B=0 8 STATES
 RET                ; 10 STATES

delay2:             ; 256 VEZES? 4080+21 STATES = 4101 STATES(1,03ms)
 DEC C              ; 4 STATES
 JR NZ, delay2      ; SATISFEITO? 12 STATES(Z=0),  SENAO 7 STATES(Z=1)
 RET     


tabela:
 .DB 0018H, 0024H, 0042H, 0081H, 0081H, 0042H, 0024H, 0018H, 00H

 HALT
 .END