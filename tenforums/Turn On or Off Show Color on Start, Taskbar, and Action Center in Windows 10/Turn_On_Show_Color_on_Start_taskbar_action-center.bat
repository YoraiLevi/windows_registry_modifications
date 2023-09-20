@echo off

:: Created by: Shawn Brink
:: Created on: May 1st 2015
:: Tutorial: http://www.tenforums.com/tutorials/5768-start-menu-taskbar-color-turn-off-windows-10-a.html


Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f


taskkill /f /im explorer.exe
start explorer.exe
