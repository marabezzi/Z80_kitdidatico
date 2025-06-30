 DEVICE NOSLOT64K
 SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

; VAI E VOLTA LED ACESSO

 ORG 0000H

 LD SP, 0FFFH
 LD A, 01H

main:
     LD D, 07H
     CALL loop_esq
     LD D, 07H
     CALL loop_dir
     JP main

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
        

delay:
        DEC C
        LD B, 02H
        CALL delay2
        JR NZ, delay
        RET
        
delay2:
        DJNZ delay2
        RET

 HALT
 .END