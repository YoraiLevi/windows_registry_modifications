@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com/
:: Tutorial: http://www.tenforums.com/tutorials/32181-taskbar-color-turn-off-show-color-only-windows-10-a.html


Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 2 /f


taskkill /f /im explorer.exe
start explorer.exe
