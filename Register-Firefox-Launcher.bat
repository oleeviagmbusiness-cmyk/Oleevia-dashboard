@echo off
title Oleevia - Register Firefox Protocol Launcher
echo ========================================================
echo   Oleevia Grameen Credits - Firefox Protocol Setup
echo ========================================================
echo.
echo Setting up one-click Firefox launcher for Beacon (Nidhi)...

set "DEST_DIR=%LOCALAPPDATA%\Oleevia"
if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"

(
echo ' Oleevia Dashboard - Firefox Protocol Launcher
echo Set args = WScript.Arguments
echo If args.Count ^> 0 Then
echo     Dim url, shell
echo     url = args^(0^)
echo     If InStr^(1, url, "firefox:", 1^) = 1 Then
echo         url = Mid^(url, 9^)
echo     End If
echo     Do While Left^(url, 1^) = "/"
echo         url = Mid^(url, 2^)
echo     Loop
echo     Set shell = CreateObject^("WScript.Shell"^)
echo     shell.Run """C:\Program Files\Mozilla Firefox\firefox.exe"" """ ^& url ^& """", 1, False
echo End If
) > "%DEST_DIR%\open-firefox.vbs"

reg add "HKCU\Software\Classes\firefox" /ve /d "URL:Firefox Protocol" /f >nul
reg add "HKCU\Software\Classes\firefox" /v "URL Protocol" /d "" /f >nul
reg add "HKCU\Software\Classes\firefox\shell\open\command" /ve /d "wscript.exe \"%DEST_DIR%\open-firefox.vbs\" \"%%1\"" /f >nul

echo.
echo [SUCCESS] Firefox launcher registered successfully!
echo You can now open Beacon in Firefox directly with one click.
echo.
pause
