

; this source code shows how we can count the number of letters
; in some string without using built-in string instructions,
; this means to count using a loop and read characters one by one...


org 100h

jmp start

str1 db 'abcdefghijklmnopq', 0

start: lea bx, str1 ; load address of string.
       mov ax, 0 ; reset counter.

compare: cmp [bx], 0 ; is it end of string?
         je done  ; if zero, then it's the end.
         inc ax   ; count char.
         inc bx   ; next memory position in string.
         jmp compare



; ax now contains the number of chars in str1.
; in this example it's 17 or 11h or 00010001b.

; print result in binary:
done:
mov bx, ax
mov cx, 8
print: mov ah, 2   ; print function.
       mov dl, '0'
       test bl, 10000000b  ; test first bit.
       jz zero
       mov dl, '1'
zero:  int 21h
       shl bl, 1
loop print

; print binary suffix:
mov dl, 'b'
int 21h


; wait for any key press....
mov ah, 0
int 16h 


ret

; this code is distributed in the  hope that it will be  useful,
; but without any  warranty; without even  the implied warranty 
; of merchantability or fitness for a particular purpose. 


