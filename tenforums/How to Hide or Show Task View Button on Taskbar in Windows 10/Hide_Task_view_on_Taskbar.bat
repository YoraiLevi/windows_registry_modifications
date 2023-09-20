@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com/
:: Tutorial: http://www.tenforums.com/tutorials/2853-task-view-taskbar-hide-show-windows-10-a.html


REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MultiTaskingView\AllUpView" /V Enabled /F

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowTaskViewButton /T REG_DWORD /D 0 /F


:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe