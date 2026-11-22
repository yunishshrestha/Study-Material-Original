; This sample shows how
; to use CMPSB instruction
; to compare strings.

ORG     100h

; set forward direction:
        CLD     

; load source into DS:SI,
; load target into ES:DI:
        MOV     AX, CS
        MOV     DS, AX
        MOV     ES, AX
        LEA     si, str1
        LEA     di, str2

; set counter to string length:
        MOV     CX, size

; compare until equal:
        REPE    CMPSB
        JNZ     not_equal

; "Yes" - equal!
        MOV     AL, 'Y'
        MOV     AH, 0Eh
        INT     10h

        JMP     exit_here

not_equal:

; "No" - not equal!
        MOV     AL, 'N'
        MOV     AH, 0Eh
        INT     10h

exit_here:

	; wait for any key press:
	MOV AH, 0
	INT 16h

        RET

; strings must have equal lengths:
x1:
str1 db 'Test string'
str2 db 'Test string'
size = ($ - x1) / 2

END
