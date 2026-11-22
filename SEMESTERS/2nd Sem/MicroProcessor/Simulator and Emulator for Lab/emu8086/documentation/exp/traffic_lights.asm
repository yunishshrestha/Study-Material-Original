#make_bin#
#CS = 500#
#IP = 0#

; Values are written virtual port of traffic lights intersection.
; Setting correct bits turns on and turns off the lights. 
; This example writes random data to port 4 for demostration only.
; virtual device: Traffic_Lights.exe

; bits F,E,D,C aren't used

; bits: FEDC BA9 876 543 210
MOV AX, 0000_111_111_111_111b


next_situation:

OUT 4, AX

DEC AX

JMP next_situation
