@echo off

:: Created by: Shawn Brink
:: Created on: April 22nd 2016
:: Updated on: June 29th 2016
:: Tutorial: http://www.tenforums.com/tutorials/48147-windows-ink-workspace-button-hide-show-taskbar-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace" /V PenWorkspaceButtonDesiredVisibility /T REG_DWORD /D 1 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe
