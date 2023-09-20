@echo off

:: Created by: Shawn Brink
:: Created on: December 24th 2017
:: Tutorial: https://www.tenforums.com/tutorials/101006-turn-off-mono-audio-windows-10-a.html


powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG ADD "HKCU\Software\Microsoft\Multimedia\Audio" /V AccessibilityMonoMixState /T REG_DWORD /D 0 /F & net stop "Audiosrv" & net start "Audiosrv"' -Verb runAs"
