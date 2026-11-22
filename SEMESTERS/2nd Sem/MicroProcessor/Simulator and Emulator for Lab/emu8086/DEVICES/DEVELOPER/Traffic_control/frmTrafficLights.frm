VERSION 5.00
Begin VB.Form frmTrafficLights 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "traffic lights on port 4"
   ClientHeight    =   3735
   ClientLeft      =   8700
   ClientTop       =   4590
   ClientWidth     =   3375
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "Fixedsys"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   FontTransparent =   0   'False
   Icon            =   "frmTrafficLights.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   3735
   ScaleWidth      =   3375
   Begin VB.PictureBox picStatus 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      FontTransparent =   0   'False
      ForeColor       =   &H80000008&
      Height          =   585
      Left            =   307
      ScaleHeight     =   585
      ScaleWidth      =   2760
      TabIndex        =   1
      Top             =   2985
      Width           =   2760
   End
   Begin VB.PictureBox picTL 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   2910
      Left            =   45
      Picture         =   "frmTrafficLights.frx":038A
      ScaleHeight     =   194
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   218
      TabIndex        =   0
      Top             =   60
      Width           =   3270
      Begin VB.Timer timerUpdate 
         Interval        =   111
         Left            =   1740
         Top             =   105
      End
   End
End
Attribute VB_Name = "frmTrafficLights"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' virual device for emu8086 it can be controlled by microprocessor emulator

' Traffic_Lights.exe

' TRAFFIC LIGHTS
' ports 4-5  (2 bytes)

' #1144

Option Explicit


' from previous port read:
Dim uSTATUS_REGISTER_L_PREV As Byte
Dim uSTATUS_REGISTER_H_PREV As Byte

' current port read:
Dim uSTATUS_REGISTER_L As Byte
Dim uSTATUS_REGISTER_H As Byte

Private Sub Form_Load()

    ' do not allow more than one copy of this program to run simuateniously
    If App.PrevInstance Then

        ShowPrevInstance

        End   ' terminate this instance!

    End If

    GetWindowPos Me
 
    update_DEVICE
    
End Sub



Private Sub Form_Unload(Cancel As Integer)
    SaveWindowState Me
End Sub


Public Sub update_DEVICE()

    picTL_Paint
    update_picStatus
    
End Sub


'Private Sub picTL_Click()
'    SavePicture picTL, "c:\1.bmp"
'End Sub

Private Sub timerUpdate_Timer()

    uSTATUS_REGISTER_L = io.READ_IO_BYTE(4)
    uSTATUS_REGISTER_H = io.READ_IO_BYTE(5)

    If uSTATUS_REGISTER_L = uSTATUS_REGISTER_L_PREV And uSTATUS_REGISTER_H = uSTATUS_REGISTER_H_PREV Then
        ' no changes!
    Else
        ' keep previous state:
        uSTATUS_REGISTER_L_PREV = uSTATUS_REGISTER_L
        uSTATUS_REGISTER_H_PREV = uSTATUS_REGISTER_H
        
        Me.Show ' ACTIVATE!
        update_DEVICE
    End If
    
End Sub



' Private Sub picStatus_Paint()
' I set it to be AutoRedraw=True, so no need to update on
' paint, also this prevents flickering:
Private Sub update_picStatus()
    On Error GoTo err_fp

    Dim sBWORD As String
    Dim s As String
    Dim i As Long
    Dim uBIT_POS As Byte
    Dim f1 As Single
    
    Const sCaptionBits = "FEDCBA9876543210"
    
    sBWORD = toBIN_WORD(to16bit_SIGNED(uSTATUS_REGISTER_L, uSTATUS_REGISTER_H))
    
    
    picStatus.CurrentX = picStatus.ScaleWidth / 2 - picStatus.TextWidth(sCaptionBits) / 2
    picStatus.CurrentY = 50 'picStatus.TextHeight(sCaptionBits)
    
    picStatus.ForeColor = RGB(100, 100, 100)
    picStatus.Print sCaptionBits
    
    picStatus.CurrentX = picStatus.ScaleWidth / 2 - picStatus.TextWidth(sBWORD) / 2
    picStatus.CurrentY = 50 + picStatus.TextHeight(sCaptionBits)
    
    
    
    For i = 1 To 16
        s = Mid(sBWORD, i, 1)
        If i < 5 Then ' draw grey bits that aren't used
            picStatus.ForeColor = RGB(170, 170, 170)
        Else
            If s = "0" Then
                picStatus.ForeColor = vbBlue
            Else
                picStatus.ForeColor = vbRed
            End If
        End If
        picStatus.Print s;
    Next i
    
    Exit Sub
    
err_fp:
    Debug.Print "trafic:picStatus_Paint: " & Err.Description
    
End Sub




' set lights:
Private Sub picTL_Paint()

    On Error GoTo err_ptlp

    Dim sBWORD As String
    Dim s As String
    Dim i As Long
    Dim uBIT_POS As Byte
    
    sBWORD = toBIN_WORD(to16bit_SIGNED(uSTATUS_REGISTER_L, uSTATUS_REGISTER_H))
    
    ' make LSB be at index 1:
    sBWORD = StrReverse(sBWORD)
    
    For i = 1 To 16
    
        s = Mid(sBWORD, i, 1)
        
        uBIT_POS = i - 1
        
        Select Case uBIT_POS
        
        ' traffic lights from right to left
        
        ' first traffic light:
        Case 11
            draw_DOT s, vbGreen, 40, 120
        Case 10
            draw_DOT s, vbYellow, 52, 120
        Case 9
            draw_DOT s, vbRed, 64, 120
        
        ' second traffic light:
        Case 8
            draw_DOT s, vbGreen, 78, 20
        Case 7
            draw_DOT s, vbYellow, 78, 32
        Case 6
            draw_DOT s, vbRed, 78, 43
            
        ' third traffic light:
        Case 5
            draw_DOT s, vbGreen, 182, 58
        Case 4
            draw_DOT s, vbYellow, 170, 58
        Case 3
            draw_DOT s, vbRed, 159, 58
            
        ' fourth traffic light:
        Case 2
            draw_DOT s, vbGreen, 145, 158
        Case 1
            draw_DOT s, vbYellow, 145, 146
        Case 0
            draw_DOT s, vbRed, 145, 134
            
        End Select
    
    Next i
    
    Exit Sub
err_ptlp:
    Debug.Print "picTL_Paint: " & Err.Description
End Sub

Private Sub draw_DOT(sSTATUS As String, lCOLOR As Long, fPosX As Single, fPosY As Single)
    Dim l As Long
    
    If sSTATUS = "1" Then
        l = lCOLOR
    Else
        l = RGB(127, 127, 127)
    End If
    
    
    ' 1.26#322 picTL.PSet (fPosX, fPosY), l
    picTL.DrawWidth = 1
    picTL.FillColor = l
    picTL.FillStyle = vbFSSolid
    
    ' 1.27 - without it first circle is
    ' drawn with current fore color (seems
    ' to be VB bug or something),
    ' DoEvents also helps.
    picTL.ForeColor = l
    
    
    picTL.Circle (fPosX, fPosY), 4, l
End Sub


Function to16bit_SIGNED(ByRef byteL As Byte, ByRef byteH As Byte) As Integer
    Dim temp As Long
    
    ' lower byte - on lower address!
    ' byte1 - lower byte!
    
    temp = byteH
    temp = temp * 256 ' shift left by 16.
    temp = temp + byteL
    
    
    to16bit_SIGNED = to_signed_int(temp)
End Function

' makes a long to be a SIGNED integer:
 Function to_signed_int(l As Long) As Integer
    If l >= -32768 And l < 65536 Then
        If l <= 32767 Then
            to_signed_int = l
        Else
            to_signed_int = l - 65536
        End If
    Else
        to_signed_int = 0
        Debug.Print "Wrong param calling to_signed_int(): " & l
    End If
End Function


' returns BINARY presentation of a number,
' return value has 16 bits (zeros & ones)
Function toBIN_WORD(ByRef iNum As Integer) As String

    Dim sHEX As String
    Dim sResult As String
    Dim i As Integer
    Dim Size As Integer
    
    sHEX = Hex(iNum)
    Size = Len(sHEX)
    
    sResult = ""
    
    For i = Size To 1 Step -1
        sResult = HEX_2_BIN(Mid(sHEX, i, 1)) & sResult
    Next i
    
    toBIN_WORD = make_min_len(sResult, 16, "0")
    
End Function


' converts single HEX digit to BINARY:
Function HEX_2_BIN(ByRef sHEX_DIGIT As String) As String
    Select Case UCase(sHEX_DIGIT)
    
    Case "0"
        HEX_2_BIN = "0000"

    Case "1"
        HEX_2_BIN = "0001"
 
    Case "2"
        HEX_2_BIN = "0010"

    Case "3"
        HEX_2_BIN = "0011"

    Case "4"
        HEX_2_BIN = "0100"

    Case "5"
        HEX_2_BIN = "0101"

    Case "6"
        HEX_2_BIN = "0110"

    Case "7"
        HEX_2_BIN = "0111"

    Case "8"
        HEX_2_BIN = "1000"

    Case "9"
        HEX_2_BIN = "1001"

    Case "A"
        HEX_2_BIN = "1010"

    Case "B"
        HEX_2_BIN = "1011"

    Case "C"
        HEX_2_BIN = "1100"

    Case "D"
        HEX_2_BIN = "1101"

    Case "E"
        HEX_2_BIN = "1110"

    Case "F"
        HEX_2_BIN = "1111"
        
    Case "h", "H"   ' ignore (suffix).
        HEX_2_BIN = ""
        
    Case Else
        Debug.Print "wrong argument in HEX_2_BIN(" & sHEX_DIGIT & ")"
    End Select
End Function


 Function make_min_len(s As String, minLen As Integer, sAddWhat As String) As String
    Dim i As Integer
    Dim sRes As String
    
    i = 0
    sRes = s
    
    While Len(sRes) < minLen
        sRes = sAddWhat & sRes
    Wend
    
    make_min_len = sRes
    
End Function


