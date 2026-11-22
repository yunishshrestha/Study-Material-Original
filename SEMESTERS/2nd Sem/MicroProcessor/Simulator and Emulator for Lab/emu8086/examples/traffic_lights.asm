#make_bin#

; values are written virtual port of traffic lights intersection.
; setting correct bits turns on and turns off the lights. 
; this example writes random data to port 4 for demostration only.
; virtual device: traffic_lights.exe

; bits f,e,d,c aren't used

; bits: fedc ba9 876 543 210
mov ax, 0000_111_111_111_111b


next_situation:

out 4, ax

dec ax

jmp next_situation
