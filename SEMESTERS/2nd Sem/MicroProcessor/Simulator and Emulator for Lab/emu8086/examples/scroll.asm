; this example shows how to use the bios scrolling functions.
; this program prints some test strings, 
; then it scrolls the window at (1,1)-(8,5) down,
; and scrolls the window at (1,1)-(8,5) up, back to where it was. 
; two lines are scrolled away and window (1,4)-(8,5) becomes blank.


org     100h

; set data segment to code segment,
; (if not set already):
push    cs
pop     ds

; set cursor position to top
mov     ah, 2
mov     dh, 0 ; row.
mov     dl, 0 ; column.
mov     bh, 0 ; page number.
int 10h


; print out the test strings:
lea     dx, msg0
mov     ah, 9
int     21h

; print "press any key to scroll up...":
lea     dx, msg1
mov     ah, 9
int     21h

; wait for any key:
xor     ax, ax
int     16h

; scroll window down:
mov     ah, 07h ; scroll down function id.
mov     al, 2   ; lines to scroll.
mov     bh, 07  ; attribute for new lines.
mov     cl, 1   ; upper col.
mov     ch, 1   ; upper row.
mov     dl, 8   ; lower col.
mov     dh, 5   ; lower row.
int     10h

; print "press any key to scroll down...":
lea     dx, msg2
mov     ah, 9
int     21h

; wait for any key:
xor     ax, ax
int     16h

; scroll window up:
mov     ah, 06h ; scroll up function id.
mov     al, 2   ; lines to scroll.
mov     bh, 07  ; attribute for new lines.
mov     cl, 1   ; upper col.
mov     ch, 1   ; upper row.
mov     dl, 8   ; lower col.
mov     dh, 5   ; lower row.
int     10h


; print "that's it, press any key...":
lea     dx, msg3
mov     ah, 9
int     21h

; wait for any key:
xor     ax, ax
int     16h

ret     ; return to operating system.

; test strings:
msg0 db '01234567890abcdef', 13, 10
     db '1aaaaaaaaaaaaaaaa', 13, 10
     db '2bbbbbbbbbbbbbbbb', 13, 10
     db '3cccccccccccccccc', 13, 10
     db '4dddddddddddddddd', 13, 10
     db '5eeeeeeeeeeeeeeee', 13, 10
     db '6ffffffffffffffff', 13, 10
     db '7gggggggggggggggg', 13, 10
     db '8hhhhhhhhhhhhhhhh', 13, 10, '$'

msg1 db 13, 10, 13, 10, 'press any key to scroll window at (1,1)-(8,5) two lines down...', 13, 10, '$'

msg2 db 'press any key to scroll window at (1,1)-(8,5) two lines up...', 13, 10, '$'

msg3 db "that's it, press any key...", 13, 10, '$'

end
