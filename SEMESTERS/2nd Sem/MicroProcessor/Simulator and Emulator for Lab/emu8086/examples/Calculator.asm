
; command prompt based simple calculator (+,-,*,/) for 8086.
; example of calculation:
; input 1 <- number:   10 
; input 2 <- operator: - 
; input 3 <- number:   5 
; ------------------- 
;     10 - 5 = 5 
; output  -> number:   5


org 100h

jmp start


;=================================
; here we declare the functions from emu8086.inc for easy input & printing.
include "emu8086.inc"  
define_scan_num ; reads a number from the user and stores it in cx register.
define_print_num ; prints a signed number in ax.
define_print_num_uns ; prints an unsigned number in ax (required by print_num).
define_get_string ; gets a string from keyboard.
;=================================


; define variables:

msg1 db 13, 10, 13, 10, 'enter first number: $'
msg2 db "enter  +  -  *  /  or 'q' to exit: $"
msg3 db 'enter second number: $'
msg4 db  13, 10 , 'result: $' 
msg5 db 'thank you for using my calculator! ', 13, 10, '$'
err1 db  'wrong operator!', 13, 10 , '$'

; operator can be ('+','-','*','/') or any other char to exit.
calcop db '?', 0

; first and second number:
num1 dw ?
num2 dw ?


start:




; output of a string at ds:dx
lea dx, msg1
mov ah, 09h
int 21h  


; get the multi-digit signed number
; from the keyboard, and store
; the result in cx register:

call scan_num

; store first number:
mov num1, cx 



; new line:
putc 13
putc 10



; output of a string at ds:dx
lea dx, msg2
mov ah, 09h
int 21h  


; get a null terminated string from user,
; the received string is written to buffer
; at ds:di, buffer size should be in dx.

mov dx, 2 ; single char.
lea di, calcop
call get_string


; new line:
putc 13
putc 10

cmp calcop, 'q'
je exit



; output of a string at ds:dx
lea dx, msg3
mov ah, 09h
int 21h  


; get the multi-digit signed number
; from the keyboard, and store
; the result in cx register:

call scan_num


; store second number:
mov num2, cx 




; output of a string at ds:dx
lea dx, msg4
mov ah, 09h
int 21h  




; making the calculation:





cmp calcop, '+'
je do_plus

cmp calcop, '-'
je do_minus

cmp calcop, '*'
je do_mult

cmp calcop, '/'
je do_div


; if none of the above:
; output of a string at ds:dx
lea dx, err1
mov ah, 09h
int 21h  

jmp start ; do it again.


exit:

; output of a string at ds:dx
lea dx, msg5
mov ah, 09h
int 21h  


; wait for any key press:
mov ah, 0
int 16h


ret  ; return control operating system.











do_plus:


mov ax, num1
add ax, num2
call print_num    ; print ax value.

jmp start ; back to start.



do_minus:

mov ax, num1
sub ax, num2
call print_num    ; print ax value.

jmp start ; back to start.




do_mult:

mov ax, num1
imul num2 ; (dx ax) = ax * num2. 
call print_num    ; print ax value.
; dx is ignored (calc works with tiny numbers only).

jmp start ; back to start.




do_div:
; dx is ignored (calc works with tiny numbers only).
mov dx, 0
mov ax, num1
idiv num2  ; ax = (dx ax) / num2.

call print_num    ; print ax value.

jmp start ; back to start.

