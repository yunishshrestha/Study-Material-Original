; simple sort
          
; this program inputs 3 numbers and
; sorts them from largest to smallest


dseg    segment 'data'
cr        equ   0dh
lf        equ   0ah
dollar    equ   '$'
new_line  db    lf, cr, dollar
msg1      db    'enter first value (-32768..32767)!'
          db    lf, cr, dollar
msg2      db    lf, cr, 'enter second value (-32768..32767)!'
          db    lf, cr, dollar
msg3      db    lf, cr, 'enter third value (-32768..32767)!'
          db    lf, cr, dollar
msg4      db    cr, lf, cr, lf, 'after sorting:', dollar
msg5      db    cr, lf, 'num1 = ', dollar
msg6      db    cr, lf, 'num2 = ', dollar
msg7      db    cr, lf, 'num3 = ', dollar
num1      dw    ?
num2      dw    ?
num3      dw    ?
dseg    ends

sseg    segment stack   'stack'
                dw      100h    dup(?)
sseg    ends

cseg    segment 'code'


;=================================
; here we declare the functions from emu8086.inc for easy input & printing.
include "emu8086.inc" 
define_clear_screen ; scrolls the entire screen window; sets cursor to top.
define_scan_num; reads a number from the user and stores it in cx register.
define_print_num ; prints a signed number in ax.
define_print_num_uns ; prints an unsigned number in ax (required by print_num).
;=================================

;****************************************

start           proc    far

; prepare for return to os:
    push    ds
    mov     ax, 0
    push    ax
; set segment registers:                
    mov     ax, dseg
    mov     ds, ax
    mov     es, ax

; clear the screen:
    call    clear_screen

; position the cursor at row=3 and column=0
    gotoxy 0, 3


; ask for first number:
    lea     dx, msg1
    call    puts       ; display the message.
    call    scan_num   ; input the number into cx.
    mov     num1, cx

; ask for second number:
    lea     dx, msg2
    call    puts       ; display the message.
    call    scan_num   ; input the number into cx.
    mov     num2, cx

; ask for third number:
    lea     dx, msg3
    call    puts       ; display the message.
    call    scan_num   ; input the number into cx.
    mov     num3, cx

; sorting:
    mov     bx, num1
    mov     cx, num2
    call    sort       ; exchange if bx<cx
    mov     num1, bx
    mov     num2, cx

    mov     bx, num2
    mov     cx, num3
    call    sort       ; exchange if bx<cx
    mov     num2, bx
    mov     num3, cx

    mov     bx, num1
    mov     cx, num2
    call    sort       ; exchange if bx<cx
    mov     num1, bx
    mov     num2, cx

; print the result:
    lea     dx, msg4
    call    puts

    lea     dx, msg5
    call    puts
    mov     ax, num1
    call    print_num ; print ax.

    lea     dx, msg6
    call    puts
    mov     ax, num2
    call    print_num ; print ax.

    lea     dx, msg7
    call    puts
    mov     ax, num3
    call    print_num ; print ax.

    lea     dx, new_line
    call    puts

    ret
 start          endp

;***********************************

; displays the message (dx-address),
; uses dos function to print:
puts    proc    near
        push    ax
        mov     ah, 09h
        int     21h
        pop     ax
        ret
puts    endp

;************************************

; if bx < cx then exchanges them
; (works with signed numbers)
sort    proc    near
        cmp     bx, cx
        jge     compared
        xchg    bx, cx
compared:
        ret
sort    endp

;************************************

cseg    ends
        end     start
