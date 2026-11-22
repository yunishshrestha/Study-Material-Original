; this is a very basic example
; of a tiny operating system.
;
; this is kernel module!
;
; it is assumed that this machine
; code is loaded by 'micro-os_loader.asm'
; from floppy drive from:
;   cylinder: 0
;   sector: 2
;   head: 0

; directive to create bin file:
#make_bin#

; where to load? (for emulator)
#load_segment=0800#
#load_offset=0000#

; these values are set to registers on load, actually only ds, es, cs, ip, ss, sp are
; important. these values are used for the emulator only in the real world these values
; are left by micro-os_loader after it boots and transfers control to this kernel.
#al=0b#
#ah=00#
#bh=00#
#bl=00#
#ch=00#
#cl=02#
#dh=00#
#dl=00#
#ds=0800#
#es=0800#
#si=7c02#
#di=0000#
#bp=0000#
#cs=0800#
#ip=0000#
#ss=07c0#
#sp=03fe#








; kernel is loaded at 0800:0000 by micro-os_loader
org 0000h

; skip the data and function delaration section:
jmp start



;=================================
; here we declare the functions from emu8086.inc for easy input & printing.
include "emu8086.inc"  
define_get_string ; gets a string from keyboard.
define_print_string ; prints null terminated string string from ds:si
define_clear_screen ; scrolls the entire screen window; sets cursor to top.
;=================================


;==== data section =====================

; welcome message:
msg  db 'welcome to micro-os!', 13, 10,
     db 'type help if you need it', 0 

cmd_size        equ 10    ; size of command_buffer
command_buffer  db cmd_size dup('x')
clean_str       db cmd_size dup(' '), 0
prompt          db '>', 0

; commands:
chelp    db 'help', 0
ccls     db 'cls', 0
cquit    db 'quit', 0
cexit    db 'exit', 0
creboot  db 'reboot', 0

help_msg db 'thank you for using micro-os!', 13, 10
         db 'list of supported commands:', 13, 10
         db 'help   - print out this list.', 13, 10
         db 'cls    - clear the screen.', 13, 10
         db 'reboot - reboot the machine.', 13, 10
         db 'quit   - same as reboot.', 13, 10  
         db 'exit   - same as reboot.', 13, 10
         db 'more to come!', 13, 10, 0

unknown  db 'unknown command: ' , 0

;======================================

start:

; set data segment:
push    cs
pop     ds

; set default video mode 80x25:
mov     ah, 00h
mov     al, 03h
int     10h

; clear screen:
call    clear_screen

; print out the message:
lea     si, msg
call    print_string


eternal_loop:

call    get_command

call    process_cmd

; make eternal loop:
jmp eternal_loop


;===========================================
get_command proc near

; set cursor position to bottom
; of the screen:
mov     ax, 40h
mov     es, ax
mov     al, es:[84h]

gotoxy  0, al

; clear command line:
lea     si, clean_str
call    print_string

gotoxy  0, al

; show prompt:
lea     si, prompt 
call    print_string


; wait for a command:
mov     dx, cmd_size    ; buffer size.
lea     di, command_buffer
call    get_string


ret
get_command endp
;===========================================

process_cmd proc    near

;//// check commands here ///
; set es to ds
push    ds
pop     es

cld     ; forward compare.

; compare command buffer with 'help'
lea     si, command_buffer
mov     cx, 5   ; size of ['help',0] string.
lea     di, chelp
repe    cmpsb
je      help_command

; compare command buffer with 'cls'
lea     si, command_buffer
mov     cx, 4   ; size of ['cls',0] string.
lea     di, ccls
repe    cmpsb
jne     not_cls
jmp     cls_command
not_cls:

; compare command buffer with 'quit'
lea     si, command_buffer
mov     cx, 5   ; size of ['quit',0] string.
lea     di, cquit
repe    cmpsb
je      reboot_command

; compare command buffer with 'exit'
lea     si, command_buffer
mov     cx, 5   ; size of ['exit',0] string.
lea     di, cexit
repe    cmpsb
je      reboot_command

; compare command buffer with 'reboot'
lea     si, command_buffer
mov     cx, 7   ; size of ['reboot',0] string.
lea     di, creboot
repe    cmpsb
je      reboot_command

;////////////////////////////

; if gets here, then command is
; unknown...

mov     al, 1
call    scroll_t_area

; set cursor position just
; above prompt line:
mov     ax, 40h
mov     es, ax
mov     al, es:[84h]
dec     al
gotoxy  0, al

lea     si, unknown
call    print_string

lea     si, command_buffer
call    print_string

mov     al, 1
call    scroll_t_area

jmp     processed

; +++++ 'help' command ++++++
help_command:

; scroll text area 9 lines up:
mov     al, 9
call    scroll_t_area

; set cursor position 9 lines
; above prompt line:
mov     ax, 40h
mov     es, ax
mov     al, es:[84h]
sub     al, 9
gotoxy  0, al

lea     si, help_msg
call    print_string

mov     al, 1
call    scroll_t_area

jmp     processed


; +++++ 'cls' command ++++++
cls_command:

; clear screen:
call    clear_screen

jmp     processed


; +++ 'quit', 'exit', 'reboot' +++
reboot_command:

; store magic value at 0040h:0072h:
;   0000h - cold boot.
;   1234h - warm boot.
mov     ax, 0040h
mov     ds, ax
mov     w.[0072h], 0000h ; cold boot.

jmp	0ffffh:0000h	 ; reboot!

; ++++++++++++++++++++++++++

processed:
ret
process_cmd endp

;===========================================

; scroll all screen except last row
; up by value specified in al

scroll_t_area   proc    near

mov dx, 40h
mov es, dx  ; for getting screen parameters.
mov ah, 06h ; scroll up function id.
mov bh, 07  ; attribute for new lines.
mov ch, 0   ; upper row.
mov cl, 0   ; upper col.
mov di, 84h ; rows on screen -1,
mov dh, es:[di] ; lower row (byte).
dec dh  ; don't scroll bottom line.
mov di, 4ah ; columns on screen,
mov dl, es:[di]
dec dl  ; lower col.
int 10h

ret
scroll_t_area   endp

;===========================================

