@echo off

:: Created by: Shawn Brink
:: Created on: June 12th 2017
:: Tutorial: https://www.tenforums.com/tutorials/86601-enable-disable-system-icons-taskbar-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V HideClock /T REG_DWORD /D 1 /F

REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V HideClock /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe