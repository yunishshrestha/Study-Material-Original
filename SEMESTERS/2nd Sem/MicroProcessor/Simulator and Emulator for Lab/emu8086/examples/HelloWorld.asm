
; the easiest way to print "hello, world!"

org 100h

jmp start       ; jump over string declaration

msg     db      'hello, world!$', 13, 10

start:  lea     dx, msg  ; load effective address of msg into dx.
        mov     ah, 09h  ; print function is 9.
        int     21h      ; do it!
        
        mov     ah, 0 
        int     16h      ; wait for any key any....
        
ret ; return to operating system.

