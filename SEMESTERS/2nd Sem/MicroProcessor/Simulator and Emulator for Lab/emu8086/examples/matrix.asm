; matrix transpose sample (reverse rows with columns).


org 100h

jmp start ; go to code...

msg db "to view matrix click vars button,", 13, 10
    db " and set elements property to 3 for these items:", 13, 10, 13, 10
    db "   matrix    ", 13, 10
    db "   row1      ", 13, 10
    db "   row2      ", '$'

matrix_size equ 3

; ----- matrix ------
matrix     db 1,2,3
row1       db 4,5,6
row2       db 7,8,9
;--------------------

i dw ?
j dw ?

start:
mov i, 0
next_i:

	; j = i + 1
	mov cx, i
	inc cx
	mov j, cx
	next_j:
	
		mov si, i
		mov bx, j
	
		mov al, matrix_size
		mov cx, si
		mul cl
		mov si, ax	
		mov dl, matrix[si][bx]
		
		mov si, i
		mov al, matrix_size
		mul bl
		mov bx, ax
		xchg matrix[bx][si], dl
		
		mov bx, j
		mov al, matrix_size
		mov cx, si
		mul cl
		mov si, ax
		mov matrix[si][bx], dl
	
	inc j
	cmp j, matrix_size
	jb next_j	
inc i
cmp i, matrix_size/2
jbe next_i


; print message....
lea dx, msg
mov ah, 9
int 21h

; wait for any key press...
mov ah, 0
int 16h

ret

end
