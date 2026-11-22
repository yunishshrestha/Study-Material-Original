; count number of key presses. the result is in bx register.
;
; you must type into the emulator's screen,
; if it closes, press screen button to re-open it.



org  100h 

; print welcome message:
mov dx, offset msg
mov ah, 9
int 21h

xor bx, bx ; zero bx register.   

wait:  mov ah, 0   ; wait for any key....
       int 16h

       cmp al, 27  ; if key is 'esc' then exit.
       je stop

       mov ah, 0eh ; print it.
       int 10h

       inc bx ; increase bx on every key press.

       jmp wait


; print result message:
stop:  mov dx, offset msg2
       mov ah, 9
       int 21h

; print result value in binary:
mov cx, 16
print: mov ah, 2   ; print function.
       mov dl, '0'
       test bx, 1000000000000000b  ; test first bit.
       jz zero
       mov dl, '1'
zero:  int 21h
       shl bx, 1
loop print
; print binary suffix:
mov dl, 'b'
int 21h


; wait for any key press:
mov ah, 0
int 16h

ret ; exit to operating system.

msg db "i will count all your keypresses. press 'esc' to stop...", 13, 10, "$"
msg2 db 13,10, "recorded keypresses: $" 
