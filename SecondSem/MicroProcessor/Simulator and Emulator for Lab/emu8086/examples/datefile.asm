; date and time functions and save to file using dos interrupts.

; this program prints the date and saves it to file when running from emu8086 the path is:
; c:\emu8086\vdrive\c\date.txt
; when running from dos prompt the path is:
; c:\date.txt


org 100h

mov ah,2ah                  ; get date 
int 21h 
add al,30h 
mov  week,al                ; 0=sunday 
add cx,0f830h               ; for years 
mov ax,cx 
call deci 
mov w. year,ax 
mov al,dh                   ; month 
call deci 
mov w. mont,ax 
mov al,dl                   ; day 
call deci 
mov w. day,ax 


mov ah,2ch                  ; get time 
int 21h 
mov al,ch                   ; hour 
call deci 
mov w. hour,ax 
mov al,cl                   ; minute 
call deci 
mov w. minu,ax 
mov al,dh                   ; second 
call deci 
mov w. seco,ax 
mov al,dl                   ; milisecond 
call deci 
mov w. cent,ax 


mov ah,09 
mov dx,offset txt 
int 21h 


mov cx, 0         ; file attribute
mov ax,3c00h      ; create new file 
mov dx, offset fildat 
int 21h 
jb error         ; error

mov w. handle, ax

mov ax,4200h 
mov bx, w. handle 
xor cx,cx              ; begin byte 0 
mov dx,0001            ; 1st byte modified is the second 
int 21h 
jb error 

mov ah,40h             ; write file 
mov bx, w. handle 
mov cx, 22             ; write 22 bytes 
mov dx,offset week 
int 21h 
jb error 


mov ah,3eh             ; close 
mov bx, w. handle 
int 21h 



; wait for any key press:
mov ah, 0
int 16h

error:                 ; leave program (unconditionally).

int 20h 


deci:                  ; calculate in decimal 
push cx
xor ah,ah 
mov cl,10 
div cl 
add ax,3030h
pop cx
ret 


fildat db "c:\date.txt",0        ; save date ant time 
handle db 0,0 


; here's data to display the date and time 


txt db 13,10,10,9,9     ; jump line and go two tabs right 
week db 0,9             ; put the day 1=monday   9 jump a colon (tab)
day db 0,0,'-'         
mont db 0,0,'-' 
year db 0,0,9 


hour db 0,0,':'       
minu db 0,0,9 
seco db 0,0,'.'
cent db 0,0,10,13,'$'         ; line feed   return   and  stop symbol (dollar). 
