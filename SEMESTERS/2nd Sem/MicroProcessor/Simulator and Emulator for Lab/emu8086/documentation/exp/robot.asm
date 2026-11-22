#make_bin#
#CS = 500#
#DS = 500#
#SS = 500#    ; stack
#SP = FFFF#
#IP = 0#

; This is an example of the robot contol.

; This code randomly moves the robot,
; and makes it to switch the lamps on and off.

; robot is a mechanical creature and it takes 
; some time for it to complete a task.
; status register is used to see if robot is busy or not.

; Robot.exe uses ports 9, 10 and 11
; source code of the robot is in:
; c:\emu8086\DEVICES\DEVELOPER\Robot\
; robot is programmed in Visual Basic 6.0


; robot base I/O port:
R_PORT EQU 9

;===================================

eternal_loop:
; wait until robot
; is ready:
CALL WAIT_ROBOT

; examine the area
; in front of the robot:
MOV AL, 4
OUT R_PORT, AL

CALL WAIT_EXAM

; get result from
; data register:
IN AL, R_PORT + 1

; nothing found?
CMP AL, 0
JE cont  ; - yes, so continue.

; wall?
CMP AL, 255  
JE cont  ; - yes, so continue.

; switched-on lamp?
CMP AL, 7
JNE lamp_off  ; - no, so skip.
; - yes, so switch it off,
;   and turn:
CALL SWITCH_OFF_LAMP 
JMP  cont  ; continue

lamp_off: NOP

; if gets here, then we have
; switched-off lamp, because
; all other situations checked
; already:
CALL SWITCH_ON_LAMP

cont:
CALL RANDOM_TURN

CALL WAIT_ROBOT

; try to step forward:
MOV AL, 1
OUT R_PORT, AL

CALL WAIT_ROBOT

; try to step forward again:
MOV AL, 1
OUT R_PORT, AL

JMP eternal_loop ; go again!

;===================================

; This procedure does not
; return until robot is ready
; to receive next command:
WAIT_ROBOT PROC
; check if robot busy:
busy: IN AL, R_PORT+2
      TEST AL, 00000010b
      JNZ busy ; busy, so wait.
RET    
WAIT_ROBOT ENDP

;===================================

; This procedure does not
; return until robot completes
; the examination:
WAIT_EXAM PROC
; check if has new data:
busy2: IN AL, R_PORT+2
       TEST AL, 00000001b
       JZ busy2 ; no new data, so wait.
RET    
WAIT_EXAM ENDP

;===================================

; Switch Off the lamp:
SWITCH_OFF_LAMP PROC
MOV AL, 6
OUT R_PORT, AL
RET
SWITCH_OFF_LAMP ENDP

;===================================

; Switch On the lamp:
SWITCH_ON_LAMP PROC
MOV AL, 5
OUT R_PORT, AL
RET
SWITCH_ON_LAMP ENDP

;===================================

; Generates a random turn using
; system timer:
RANDOM_TURN PROC

; get number of clock
; ticks since midnight
; in CX:DX
MOV AH, 0
INT 1Ah

; randomize using XOR:
XOR DH, DL
XOR CH, CL
XOR CH, DH

TEST CH, 2
JZ no_turn

TEST CH, 1
JNZ turn_right

; turn left:
MOV AL, 2
OUT R_PORT, AL
; exit from procedure:
RET  

turn_right:
MOV AL, 3
OUT R_PORT, AL

no_turn:
RET
RANDOM_TURN ENDP

;===================================
