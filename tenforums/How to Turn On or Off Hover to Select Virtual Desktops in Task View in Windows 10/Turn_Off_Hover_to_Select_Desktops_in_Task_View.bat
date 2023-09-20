@echo off

:: Created by: Shawn Brink
:: Created on: November 18th 2016
:: Tutorial: http://www.tenforums.com/tutorials/70201-task-view-hover-select-desktops-turn-off-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /V HoverSelectDesktops /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe
