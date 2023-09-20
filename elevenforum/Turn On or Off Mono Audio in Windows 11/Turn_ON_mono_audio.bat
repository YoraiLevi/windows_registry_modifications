@echo off

:: Created by: Shawn Brink
:: Created on: April 14, 2022
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-mono-audio-in-windows-11.5861/


powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG ADD "HKCU\Software\Microsoft\Multimedia\Audio" /V AccessibilityMonoMixState /T REG_DWORD /D 1 /F & net stop "Audiosrv" & net start "Audiosrv"' -Verb runAs"
