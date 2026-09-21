' Oleevia Dashboard - Firefox Protocol Launcher
Set args = WScript.Arguments
If args.Count > 0 Then
    Dim url, shell
    url = args(0)
    If InStr(1, url, "firefox:", 1) = 1 Then
        url = Mid(url, 9)
    End If
    ' Also strip leading slashes if firefox:// was used
    Do While Left(url, 1) = "/"
        url = Mid(url, 2)
    Loop
    Set shell = CreateObject("WScript.Shell")
    shell.Run """C:\Program Files\Mozilla Firefox\firefox.exe"" """ & url & """", 1, False
End If
