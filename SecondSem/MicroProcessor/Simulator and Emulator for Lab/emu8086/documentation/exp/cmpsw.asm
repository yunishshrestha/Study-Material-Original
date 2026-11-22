; This sample shows how
; to use CMPSW instruction
; to compare strings.

ORG     100h

; set forward direction:
        CLD     

; load source into DS:SI,
; load target into ES:DI:
        MOV     AX, CS
        MOV     DS, AX
        MOV     ES, AX
        LEA     si, dat1
        LEA     di, dat2

; set counter to data length in words:
        MOV     CX, size

; compare until equal:
        REPE    CMPSW
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

; data vectors must have equal lengths:
x1:
dat1 DW 1234h, 5678h, 9012h, 3456h
dat2 DW 1234h, 5678h, 9012h, 3456h
size = ($ - x1) / 4

END
