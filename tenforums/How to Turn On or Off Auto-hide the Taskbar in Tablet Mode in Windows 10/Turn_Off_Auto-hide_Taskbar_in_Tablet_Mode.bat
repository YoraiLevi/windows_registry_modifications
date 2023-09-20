@echo off

:: Created by: Shawn Brink
:: Created on: April 22nd 2016
:: Tutorial: http://www.tenforums.com/tutorials/48127-taskbar-auto-hide-tablet-mode-turn-off-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarAutoHideInTabletMode /T REG_DWORD /D 0 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe
