@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com/
:: Tutorial: http://www.tenforums.com/tutorials/3430-file-explorer-title-bar-display-full-path-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /V FullPath /T REG_DWORD /D 0 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe