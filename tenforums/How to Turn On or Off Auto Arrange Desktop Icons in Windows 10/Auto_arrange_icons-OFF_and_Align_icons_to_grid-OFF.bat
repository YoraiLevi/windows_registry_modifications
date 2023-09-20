@echo off

:: Created by: Shawn Brink
:: Created on: 
:: Tutorial: http://www.tenforums.com/tutorials/57518-desktop-icons-auto-arrange-turn-off-windows-10-a.html 



REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V FFLAGS /T REG_DWORD /D 1075839520 /F

taskkill /f /im explorer.exe
start explorer.exe
