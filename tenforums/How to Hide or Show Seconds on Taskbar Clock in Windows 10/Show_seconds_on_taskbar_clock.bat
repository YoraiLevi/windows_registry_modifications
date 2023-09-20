@echo off

:: Created by: Shawn Brink
:: Created on: January 3rd 2017
:: Tutorial: https://www.tenforums.com/tutorials/73967-clock-taskbar-hide-show-seconds-windows-10-a.html



REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowSecondsInSystemClock /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe
