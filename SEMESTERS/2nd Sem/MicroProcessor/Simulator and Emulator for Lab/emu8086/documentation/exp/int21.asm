; This sample gets a string from a user, then it prints it out.
; This example uses DOS interrupt: 21h

ORG  100h

jmp start


; data:
s1 DB 30,?, 30 dup(' ') ; buffer to hold a string, first byte is buffer size.
nl DB 13, 10, '$'     ; carrige return and new line ASCII codes.


start:
; set data segment:
        MOV AX, CS
        MOV DS, AX
        MOV ES, AX

; input a string:
        MOV DX, OFFSET s1
        MOV AH, 0Ah
        INT 21h

; get one line down, by printing new line characters:
        MOV DX, OFFSET nl
        MOV AH, 9
        INT 21h

; set '$' to the end of inputed string:
        MOV DI, OFFSET s1
        XOR BX, BX
; second byte of buffer holds
; the number of inputed characters:
        MOV BL, [DI+1]
        MOV BYTE PTR [DI+BX+2], '$'

; print the entered string:
        MOV DX, offset s1
; first byte is buffer size,
; second byte is actual characters entered,
; we skip these 2 bytes:
        ADD DX, 2
        MOV AH, 9
        INT 21h

; wait for any key press.....
        MOV AH, 0
        INT 16h


; exit to the operating system:
        MOV AH, 4Ch
        INT 21h
