@echo off

:: Created by: Shawn Brink
:: Created on: September 2nd 2016
:: Tutorial: http://www.tenforums.com/tutorials/57521-desktop-icons-align-grid-turn-off-windows-10-a.html 



REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V FFLAGS /T REG_DWORD /D 1075839525 /F

taskkill /f /im explorer.exe
start explorer.exe
