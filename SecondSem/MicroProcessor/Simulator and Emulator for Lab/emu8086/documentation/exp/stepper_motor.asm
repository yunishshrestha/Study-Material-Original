#make_bin#
#CS = 500#
#IP = 0#

; This is an example of OUT instruction.
; It writes values to virtual I/O port
; that controls the stepper-motor.
; Stepper_motor.exe is on port 7


steps_before_direction_change = 20h ; 32 (decimal)

jmp start

; ========= DATA ===============

; bin data for clock-wise
; half-step rotation:
datCW    db 0000_0110b
         db 0000_0100b    
         db 0000_0011b
         db 0000_0010b

; bin data for counter-clock-wise
; half-step rotation:
datCCW   db 0000_0011b
         db 0000_0001b    
         db 0000_0110b
         db 0000_0010b


; bin data for clock-wise
; full-step rotation:
datCW_FS db 0000_0001b
         db 0000_0011b    
         db 0000_0110b
         db 0000_0000b

; bin data for counter-clock-wise
; full-step rotation:
datCCW_FS db 0000_0100b
          db 0000_0110b    
          db 0000_0011b
          db 0000_0000b


start:
MOV BX, offset datCW ; start from clock-wise half-step.
MOV SI, 0
MOV CX, 0 ; step counter

next_step:
; motor sets top bit when it's ready to accept new command
wait:   IN AL, 7     
        TEST AL, 10000000b
        JZ wait

MOV AL, [BX][SI]
OUT 7, AL

INC SI

CMP SI, 4
JB next_step
MOV SI, 0

INC CX
CMP CX, steps_before_direction_change
JB  next_step

MOV CX, 0
ADD BX, 4 ; next bin data

CMP BX, offset datCCW_FS
JBE next_step

MOV BX, offset datCW ; return to clock-wise half-step.

JMP next_step



; copyright emu8086.com (c) 2005

