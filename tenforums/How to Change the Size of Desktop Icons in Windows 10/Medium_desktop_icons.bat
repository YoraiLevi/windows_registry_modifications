@echo off

:: Created by: Shawn Brink
:: Created on: September 2nd 2016
:: Tutorial: http://www.tenforums.com/tutorials/62393-desktop-icons-size-change-windows-10-a.html



REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V IconSize /T REG_DWORD /D 48 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V Mode /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V LogicalViewMode /T REG_DWORD /D 3 /F


taskkill /f /im explorer.exe
start explorer.exe
