; this sample gets two numbers from the user,
; then it calculates the sum of these numbers,
; and prints it out.


org     100h

; skip variable and function declarations:
jmp     start


;=================================
; here we declare the functions from emu8086.inc for easy input & printing.
include "emu8086.inc"  
define_scan_num; reads a number from the user and stores it in cx register.
define_print_num ; prints a signed number in ax.
define_print_num_uns ; prints an unsigned number in ax (required by print_num).
;=================================
    
msg1  db 13, 10, 'input numbers in this range: [-32768..32767]', 13, 10
      db 13, 10, 'enter first number: $'

msg2  db 13, 10, 'enter second number: $'

msg3  db 13, 10, 'the sum is: $'

; declaration of variable:
num  dw ?

start:


; print first message
mov dx, offset msg1
mov ah, 9
int 21h


call    scan_num

; keep first number:
mov     num, cx


; print second message
mov dx, offset msg2
mov ah, 9
int 21h


call    scan_num


; add numbers:
add     num, cx
jo      overflow


; print the result:
mov dx, offset msg3
mov ah, 9
int 21h


mov     ax, num
call    print_num

jmp     exit

; process overlow error:
overflow:
   
   printn 'we have overflow!'


exit:

; wait for any key press:
mov ah, 0
int 16h

ret   ; return control to operating system.


