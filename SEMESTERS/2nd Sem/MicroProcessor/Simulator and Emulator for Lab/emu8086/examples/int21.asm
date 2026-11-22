; this sample gets a string from a user, then it prints it out.
; this example uses dos interrupt: 21h

org  100h

jmp start


; data:
s1 db 30,?, 30 dup(' ') ; buffer to hold a string, first byte is buffer size.
nl db 13, 10, '$'     ; carrige return and new line ascii codes.


start:
; set data segment:
        mov ax, cs
        mov ds, ax
        mov es, ax

; input a string:
        mov dx, offset s1
        mov ah, 0ah
        int 21h

; get one line down, by printing new line characters:
        mov dx, offset nl
        mov ah, 9
        int 21h

; set '$' to the end of inputed string:
        mov di, offset s1
        xor bx, bx
; second byte of buffer holds
; the number of inputed characters:
        mov bl, [di+1]
        mov byte ptr [di+bx+2], '$'

; print the entered string:
        mov dx, offset s1
; first byte is buffer size,
; second byte is actual characters entered,
; we skip these 2 bytes:
        add dx, 2
        mov ah, 9
        int 21h

; wait for any key press.....
        mov ah, 0
        int 16h


; exit to the operating system:
        mov ah, 4ch
        int 21h
