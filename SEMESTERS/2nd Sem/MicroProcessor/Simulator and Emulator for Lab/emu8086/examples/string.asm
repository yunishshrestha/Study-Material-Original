; this sample shows the use of input and output string functions of emu8086.inc
; it code does not require dos interrupts and may be used for developing
; operating system or boot record loader.

org     100h

jmp start  ; skip over the declarations and data


;=================================
; here we declare the functions from emu8086.inc for easy input & printing.
include "emu8086.inc"  
define_get_string ; gets a string from keyboard.
define_print_string ; prints null terminated string string from ds:si
;=================================


buffer db 'empty buffer --- empty buffer'
size = $ - offset buffer  ; declare constant
msg1   db 'enter a string: ', 0


start:
; print a welcome message:
lea     si, msg1
call    print_string

; get string to ds:di
lea     di, buffer      ; buffer offset.
mov     dx, size        ; buffer size.
call    get_string

putc    13
putc    10 ; next line.

; print using macro:
print "you've entered: "

; print string in ds:si using procedure:
mov     si, di
call    print_string

ret

