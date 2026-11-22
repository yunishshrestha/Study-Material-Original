; PrinterDemo.asm - Andrew Nelis 2003
;
; Simple demonstration of the printer.
;

#make_bin#

lea bx, message
mov cx, 27d	; Length of message
mov ax, 0h	; Ensure top and bottom of
		; ax empty

spit:
mov al, [bx]	; Put char into al
out 130d, al	; push char out port
		; (ie. into printer)

inc bx		; inc pointer

wait:		; Loop to ensure the printer
in al, 130d	; is ready, it clears
or al, 0	; the port when this is true.
jnz wait

loop spit	; Go back and repeat if we're
		; not finished

hlt             ; stop!

message db "Hello World!", 10, 13, "------------", 07
