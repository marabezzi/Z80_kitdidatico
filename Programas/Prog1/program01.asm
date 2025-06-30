; ===========================================================
; Aciona LEDs
; Autor: Prof. Dr. Guilherme A. M. Clerice
; 12/03/2025
; ==========================================================


; ==========================================================
; --- Mapeamento de Hardware ---

porta = 01h             ; Endereco do portA (saida)

;===========================================================
; --- Vetor de RESET --
 .org 00h		; Inicia no endereco de memoria 00h


; ==========================================================
; --- Programa Principal


 ld A, 00AAh		; Carrega no registrador A 10101010
 
loop:			; Sub-rotina loop
 out (porta), A		; Coloca na saida 01h o conteudo de A
 CPL			; Complementa o registrador A		
 jp loop;		; Pulo para sub-rotina loop
 
 .end                    ; encerra              
					