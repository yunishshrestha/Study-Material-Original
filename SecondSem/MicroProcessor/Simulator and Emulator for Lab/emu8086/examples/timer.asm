; this sample shows the use of a timer function (int 15h / 86h)
; this code prints some chars with 1 second delay.

org     100h

; set the segment register, just in case:
mov     ax, cs
mov     ds, ax

next_char:
cmp     count, 0
jz      stop

; print char:
mov     al, c1
mov     ah, 0eh
int     10h

; next ascii char:
inc     c1
dec     count

; set interval (1 million microseconds - 1 second):
mov     cx, 0fh
mov     dx, 4240h
mov     ah, 86h
int     15h

; stop any error:
jc      stop    

jmp     next_char

stop:
ret

count   db      10
c1      db      'a'



