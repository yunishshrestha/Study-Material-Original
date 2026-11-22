; a tiny example of multi segment executable file.
; data is stored in a separate segment, segment registers must be set correctly.

dseg    segment 'data'
msg     db      'hello, world! $', 13, 10
dseg    ends

sseg    segment stack   'stack'
        dw      100h    dup(?)
sseg    ends

cseg    segment 'code'

;*******************************************

start   proc    far

; set segment registers:
        mov     ax, dseg
        mov     ds, ax
        mov     es, ax

; print "hello, world!":
        lea     dx, msg
        mov     ah, 09h
        int     21h


; wait for any key...
        mov     ah, 0
        int     16h


; return control to the operating system:
        mov     ah, 4ch
        int     21h

        ret
 start  endp

;*******************************************

cseg    ends
        end     start
