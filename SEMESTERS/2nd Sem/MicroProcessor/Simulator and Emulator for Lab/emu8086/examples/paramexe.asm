
; this sample prints out the command line parameters.
; in dos you simply add this line after an executable, for example:

; paramexe p1 p2 p3

; it is possible to set parameter in emulator 
; by selecting "set command line parameters" from the "file" menu.


dseg    segment 'data'
msg db 'no command line parameters!', 13, 10, '$'
dseg    ends

sseg    segment stack   'stack'
    dw  100h    dup(?)
sseg    ends

cseg    segment 'code'

;*******************************************

start   proc    far

; set segment registers:
    mov ax, dseg
    
    mov ds, ax

; we'll keep psp address in es,
; so es is not set to data segment.

; address of command line:
mov si, 80h

; copy command line to our buffer:
xor cx, cx      ; zero cx register.
mov cl, es:[si] ; get command line size.

cmp cx, 0       ; cx = 0 ?
jz  no_param    ; then skip the copy.

inc si          ; start printing from second byte.
next_char:
mov al, es:[si]
mov ah, 0eh     ; print out in teletype mode
int 10h
inc si
loop    next_char

jmp exit    ; skip error message.

no_param:
; print out the error message:
lea dx, msg
mov ah, 09h
int 21h


exit:
; wait for any key press...
mov ah, 0
int 16h


; return control to the operating system:
mov ah, 4ch
int 21h

ret
start   endp

;*******************************************

cseg    ends
    end start
