@echo off

:: Created by: Shawn Brink
:: Created on: May 26, 2020
:: Tutorial: https://www.tenforums.com/tutorials/153010-turn-off-taskbar-icons-easier-touch-windows-10-2n1-pc.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V AppIconInTouchImprovement /T REG_DWORD /D 0 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe
