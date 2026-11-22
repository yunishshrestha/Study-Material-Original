; this is a very basic example of a tiny operating system.

; directive to create boot file:
   #make_boot#

; this is an os loader only!
;
; it can be loaded at the first sector of a floppy disk:

;   cylinder: 0
;   sector: 1
;   head: 0

;
; the code in this file is supposed to load the kernel (micro-os_kernel.asm)
; and to pass control over it. the kernel code should be on floppy at:

;   cylinder: 0
;   sector: 2
;   head: 0

; memory table (hex):
; -------------------------------
; 07c0:0000 |   boot sector
; 07c0:01ff |   (512 bytes)
; -------------------------------
; 07c0:0200 |    stack
; 07c0:03ff |   (255 words)
; -------------------------------
; 0800:0000 |    kernel
; 0800:1400 | 
;           |   (currently 5 kb,
;           |    10 sectors are
;           |    loaded from
;           |    floppy)
; -------------------------------

; micro-os_loader.asm file produced by this code should be less or
; equal to 512 bytes, since this is the size of the boot sector!
; current version is assembled into 103 bytes.


; boot record is loaded at 0000:7c00
org 7c00h

; skip the data and function declaration section:
jmp start



;=================================
; here we declare function from emu8086.inc for easy printing.
include "emu8086.inc"  
define_print_string ; prints null terminated string string from ds:si
;=================================

;==== data section =====================

; welcome message:
msg  db 'welcome to micro-os', 13, 10,
     db 'loading...', 0

;======================================

start:

push    cs   ; make sure ds=cs
pop     ds

; initialize the stack:
mov     ax, 07c0h
mov     ss, ax
mov     sp, 03feh ; top of the stack.


; set data segment:
push    cs
pop     ds

; set default video mode 80x25:
mov     ah, 00h
mov     al, 03h
int     10h

; print welcome message:
lea     si, msg
call    print_string

;===================================
; load the kernel at 0800h:0000h
; 10 sectors starting at:
;   cylinder: 0
;   sector: 2
;   head: 0

; bios passes drive number in dl,
; so it's not changed:

mov     ah, 02h ; read function.
mov     al, 10  ; sectors to read.
mov     ch, 0   ; cylinder.
mov     cl, 2   ; sector.
mov     dh, 0   ; head.
; dl not changed! - drive number.

; es:bx points to receiving
;  data buffer:
mov     bx, 0800h   
mov     es, bx
mov     bx, 0

; read!
int     13h
;===================================

; pass control to kernel:
jmp     0800h:0000h

;===========================================

