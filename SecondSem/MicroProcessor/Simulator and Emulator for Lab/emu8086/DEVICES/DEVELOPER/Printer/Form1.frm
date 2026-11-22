VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Printer"
   ClientHeight    =   5280
   ClientLeft      =   9420
   ClientTop       =   1500
   ClientWidth     =   3630
   BeginProperty Font 
      Name            =   "Courier"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5280
   ScaleWidth      =   3630
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   1800
      Top             =   360
   End
   Begin VB.CommandButton NewPage 
      Caption         =   "New page"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2280
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.PictureBox Paper 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      FillStyle       =   0  'Solid
      FontTransparent =   0   'False
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   120
      ScaleHeight     =   287
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   223
      TabIndex        =   2
      Top             =   840
      Width           =   3375
   End
   Begin VB.Label Label1 
      Caption         =   "Printer data port: 130"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    If App.PrevInstance Then

    ShowPrevInstance

    End  ' terminate this instance!

    End If

    Call startup
    Call head_reset
End Sub

Private Sub NewPage_Click()
    Paper.Cls
    Call General.head_reset
End Sub

Private Sub Timer1_Timer()
On Error GoTo err1
    
    Dim port_num As Long
    port_num = 130
    'Dim char As Byte
         
    char = Int(READ_IO_BYTE(port_num))
    If char <> 0 Then
        Debug.Print char
        Call printer_print(Chr$(char))
        Call WRITE_IO_BYTE(port_num, 0)
        Me.Show
    End If
    
    char = 0
    
    Exit Sub
err1:
    Debug.Print "Err1"
    
End Sub




' code to avoid running two printers
Private Function ShowPrevInstance() As Boolean ' returns True on sucess.
On Error GoTo err1:

    Dim sOldTitle As String
    Dim lWindowHandle As Long

    'saving the current title in OldTitle variable
    'and changing the application title

    sOldTitle = App.Title
    App.Title = "NNNNNN - I WILL CLOSE MYSELF"

    'finding the previous instance, if you are using VB 5.0, change "ThunderRT6Main" to "ThunderRT5Main"
    lWindowHandle = FindWindow("ThunderRT6Main", sOldTitle)

    'if there is no old instances of your application - exit.
    If lWindowHandle = 0 Then
    ShowPrevInstance = False
    Exit Function
    End If

    'Find the window we need to restore
    lWindowHandle = GetWindow(lWindowHandle, GW_HWNDPREV)

    'Now restore it
    Call OpenIcon(lWindowHandle)

    'And Bring it to the foreground
    Call SetForegroundWindow(lWindowHandle)
      
    ShowPrevInstance = True
    Exit Function
err1:
    Debug.Print "ShowPrevInstance: " & err.Description
    Resume Next
End Function
