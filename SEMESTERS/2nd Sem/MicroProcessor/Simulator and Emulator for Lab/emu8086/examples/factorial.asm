; this example gets the number from the user,
; and calculates factorial for it.
; supported input from 0 to 8 inclusive!

org     100h

jmp start


;=================================
; here we declare the functions from emu8086.inc for easy input & printing.
include "emu8086.inc"  
define_scan_num; reads a number from the user and stores it in cx register.
define_print_num ; prints a signed number in ax.
define_print_num_uns ; prints an unsigned number in ax (required by print_num).
;=================================

result dw ?
     


start:

; get first number:

mov dx, offset msg1
mov ah, 9
int 21h
jmp n1
msg1 db 13, 10, 'enter the number: $'
n1:

call    scan_num


; factorial of 0 = 1:
mov     ax, 1
cmp     cx, 0
je      print_result

; move the number to bx:
; cx will be a counter:

mov     bx, cx

mov     ax, 1
mov     bx, 1

calc:
mul     bx
cmp     dx, 0
jne     overflow
inc     bx
loop    calc

mov result, ax


print_result:

; print result in ax:
mov dx, offset msg2
mov ah, 9
int 21h
jmp n2
msg2 db 13, 10, 'factorial: $'
n2:


mov     ax, result
call    print_num_uns
jmp     exit


overflow:
mov dx, offset msg3
mov ah, 9
int 21h
jmp n3
msg3 db 13, 10, 'the result is too big!', 13, 10, 'use values from 0 to 8.$'
n3:
jmp     start

exit:

; wait for any key press:
mov ah, 0
int 16h

ret


