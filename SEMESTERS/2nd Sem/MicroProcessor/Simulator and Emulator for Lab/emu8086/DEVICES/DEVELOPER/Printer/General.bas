Attribute VB_Name = "General"

' Declarations to avoid duplicate instances of printer running:
Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Declare Function OpenIcon Lib "user32" (ByVal hwnd As Long) As Long
Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Public Const GW_HWNDPREV = 3


' Just a few more declarations.

Public Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Public head_x, head_y, page_w, page_h, char_w, char_h
Public margin_l, margin_r, margin_t, margin_b

Sub startup()
' Set a few constants
    page_w = 210: page_h = 200
    char_w = 8: char_h = 15
    margin_l = 3
    margin_t = 5: margin_b = 300
End Sub

Sub printer_print(char)
    'Main sub, handles requests to print char on the page, whether char is a normal
    'letter or a control code.

    If Asc(char) < 32 Then
        Select Case Asc(char)
            Case 7
                'BELL
                Beep
            Case 8
                'BACKSPACE
                Call head_right
            Case 9
                '(Horiz)TAB (4)
                'Haven't finished this one
            Case 10
                'Line feed
                Call head_lf
            Case 13
                'Carriage return (typo?)
                Call head_cr
        End Select
    Else
        'It's a printable character:
        'Print it out
        Call head_print(head_x, head_y, char)
        'Attempt to move the head right
        Call head_left
    End If

End Sub


Sub head_print(x, y, digit)
    ' Uh... print a char on the page
    Call General.TextOut(Form1.Paper.hdc, x, y, digit, 1)
    ' Is this slow? Doesn't matter too much...
    Form1.Paper.Refresh
End Sub

Sub head_reset()
    'Clear the page, return print head back to start.
    head_x = margin_l
    head_y = margin_t
End Sub

Sub head_left()
    'Backspace sort of thing
    If (head_x + char_w) <= page_w Then
        head_x = head_x + char_w
    End If
End Sub

Sub head_right()
    'Move head right if possible
    If (head_x - char_w) >= margin_l Then
        head_x = head_x - char_w
    End If
    'For x = 0 To char_w
    '    'DoEvents
    '    'Sleep (10)
    '    Form1.print_head.Move (1)
    '    Form1.print_head.Refresh
    '    Form1.Refresh
    'Next
End Sub

Sub head_lf()
    'Line feed : move head down a lin (or paper up if you prefer ;)
    If (head_y + (char_h * 2)) <= margin_b Then
        head_y = head_y + char_h
    End If
End Sub

Sub head_cr()
    start_x = head_x
    head_x = margin_l
'    For x = start_x To margin_l Step -1
'        DoEvents
'        Sleep (10)
'        Form1.print_head.Move (-1)
'    Next x
End Sub
