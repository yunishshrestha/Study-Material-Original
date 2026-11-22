; this is just a test file, it was used to check the assembler,
; it does nothing specific, in fact, no one knows what it does.

org 100h


jmp start  ; skip over declarations...

arr  db 1, 2, 3, 4, 5
v1   dw 1234h
d1   db 33h
d2   db 44h
msg1 db 'test successful!', '$'

start:

; test nibble separator:
mov ax, 1000_0011_0001_1111b
mov ax, 0ab_cdh

; test location counter:
mov ax, $  ; get in ax my own address...


jmp over_me
s db 'aaabbbaaa'
size = $ - offset s
db '$'
s_size  dw $ - offset s
s_size2 dw size



over_me:
mov bx, 1
mov si, 1

mov arr[bx][si], 1

add [bx][si] arr, 1




mov al, 95h
add al, 95h
daa		; al=90h , cf=1, af=1

mov al, 05h
add al, 15h
daa		; al=20h , cf=0, af=1


		
mov al, 0
sub al, 95h
das		; al=05h , cf=1, af=1

mov al, 50h
sub al, 15h
das             ; al=35h , cf=0, af=1


mov ax, [bp]
mov ax, [bp+0]
mov ax, [bp+3]

mov dl, 12h
mov dh, 34h

xchg dl, dh

xchg d1, dl
xchg dh, d2


lea bx, v1
mov b. [bx], 5

xor cx, cx

mov cl, 1
or  cl, 2
xor cl, 1
not cl
neg cl
neg cl

mov cx, 0abcdh
or  cx, 10b
xor cx, 00b00h
not cx
neg cx
neg cx


mov al, 5
stc		; set carry flag.
sbb al, 0       ; al = al - 0 - cf = 4

stc		; set carry flag.
adc al, 0       ; al = al + 0 + cf = 5


mov al, 5
stc		; set carry flag.
sbb al, 2       ; al = al - 2 - cf = 2

stc		; set carry flag.
adc al, 2       ; al = al + 2 + cf = 5



stc
; just clear cf:
add al, 0

stc
; clear cf, set zf:
sub al, al     ; al = 0.


; ax = 10 * 2 = 20 (14h)
mov ax, 10
shl ax, 1

; ax = 10 * 2 = 20 (14h)
mov bl, 2
mov ax, 10
mul bl



mov ax, 1234h
mov bx, 5678h

xchg ax, bx

; the same as xchg:
xor ax, bx
xor bx, ax
xor ax, bx


lea bx, dat
mov al, 2
xlatb     ; al = 33h

jmp skip_data

dat db 11h, 22h, 33h, 44h, 55h

skip_data:


mov al, 00000111b
xor al, 00000010b    ; al = 00000101b


mov al, 00000101b
test al, 1         ; zf = 0.
test al, 10b       ; zf = 1.


mov ax, 0
mov cx, 5
m1: inc ax
loop m1

mov al, 2
mov cx, 5
m2: cmp al, 2
loope m2

mov al, 2
mov cx, 5
m3: cmp al, 2
loopne m3


mov al, 1
mov ah, 1
cmp al, ah


mov cl, 0
mov ax, 5
shl ax, cl

mov cl, 1
mov ax, 0ffffh
shl ax, cl
sal ax, cl
shr ax, cl
sar ax, cl
rol ax, cl
ror ax, cl
rcl ax, cl
rcr ax, cl

mov cl, 1
mov al, 0ffh
shl al, cl
sal al, cl
shr al, cl
sar al, cl
rol al, cl
ror al, cl
rcl al, cl
rcr al, cl

lea bx, a
shl [bx], cl
shl [bx], 2
shl word ptr [bx], cl
shl word ptr [bx], 3


; the same as mov ax, 12
mov     ax, 7 * 2 - 2
mov     ax, -2 + 7 * 2

; the same as mov ax, 10
mov     ax, (-2 + 7) * 2

; the same as mov ax, -10
mov     ax, (2 - 7) * 2
mov     ax, (- 7 + 2) * 2

; hexadecimal input:
mov	ax, 10h	    ; 16
mov	ax, 10h - 1 ; 15
mov	ax, 10h / 2 ; 8

; octal input:
mov	ax, 11o		; 9

; binary input:
mov	ax, 1010b	; 10
; 100:
mov	ax, 1010b * 0ah

; modify variables using memory
; pointers:
mov si, offset a
cs:
mov [si], 44h
cs:
mov [si+1], 55h

; treat two byte variables
; as a single word variable:
mov cs:w.[si], 0

; low byte is stored at
; lower address:
cs:
mov w.[si], 1234h

mov w. cs: [si], 5678h

; same thing, using different
; syntax:

mov word ptr a, 5
mov word ptr a, 5678h
mov byte ptr a, 1
mov a, 2

; compiler should report errors:
; mov a, 5678h  
; mov  bx, a

mov bx, w.a
mov cx, word ptr a


; unconditional jump forward:
; skip over next 2 bytes,
jmp $2
a db 3    ; 1 byte.
b db 4    ; 1 byte.

; should be compiled:
; just a check of different
; memory access syntax:

mov al, [bx + si]
mov al, [bx + di]
mov al, [bp + si]
mov al, [bp + di]
mov al, [bp + di]

mov al, [si]
mov al, [di]
mov al, a ; d16 (variable offset only)
mov al, [bx]

; + d8
mov al, [bx + si] + 5
mov al, [bx + di] + 6
mov al, [bp + si] + 7
mov al, [bp + di] + 8

; + d8
mov al, [si] + 9
mov al, [di] + 1
mov al, [bp] + 2
mov al, [bx] + 3

; + d16
mov al, [bx + si] + 1234h
mov al, [bx + di] + 1234h
mov al, [bp + si] + 1234h
mov al, [bp + di] + 1234h

; + d16
mov al, [si] + 1234h
mov al, [di] + 1234h
mov al, [bp] + 1234h
mov al, [bx] + 1234h



; jcc jump back 7 bytes:
; (jmp takes 2 bytes itself)
mov bl,9
dec bl      ; 2 bytes.
cmp bl, 0   ; 3 bytes.
jnz $-7

; modify only high byte
; of a variable
mov bx, 1
mov b.v1[bx], 50h

; modify two byte
; variables in once:
xor bx, bx  ; bx = 0
mov w.d1[bx], 1234h

;==========================

; signed byte
;  multiplication:
; ax = al * bl = 10
;               (000ah)
mov al, -5
mov bl, -2
imul bl

nop

; unsigned byte
;  multiplication:
; ax = al * bl = 63754
;               (0f90ah)
mov al, 251
mov bl, 254
mul bl

nop

; signed word
;  multiplication:
; (dx ax) = ax * bx = 10
;            (0000 000ah)
mov ax, -5
mov bx, -2
imul bx

nop

; unsigned word
;  multiplication:
; (dx ax) = ax * bx = 4294508554
;            (0fff9 000ah)
mov ax, 65531
mov bx, 65534
mul bx

nop

;==========================

; signed word
;  division:
; al = ax / bl = 2
; ah = -3 (remainder) (0fdh)
mov ax, -13
mov bl, -5
idiv bl

nop

; unsigned word
;  division:
; al = ax / bl = 254 (0feh)
; ah = 230 (remainder) (0e6h)
mov ax, 65000
mov bl, 255
div bl

nop


; signed double-word
;  division:
; ax = (dx ax) / bx = 2
; dx = -3 (remainder) (0fffdh)
mov ax, -13
; convert word to double-word
;         (ax  to dx ax)
cwd  
mov bx, -5
idiv bx

nop


; unsigned double-word
;  division:
; ax = (dx ax) / bx = 
;    1048575 / 255 = 4112
;                   (1010h)
; dx = 15 (remainder)
;    (000fh)
mov dx, 0fh
mov ax, 0ffffh
mov bx, 255
div bx

nop

;==========================

; do some more math....
mov cl, 2
mov ax, 255
div cl

mov ax, 255
shr ax, 1

; print some text....
lea dx, msg1
mov ah, 9
int 21h

; wait for any key...
mov ah, 0
int 16h


ret  ; return to operating system.


; execution never gets here.....
; this code is never executed...
; but the byte size of the exe-cute-able file is increased.

mov ax, 12
add ax, 15


end_of_test db 'end of test - byte size changed!'

