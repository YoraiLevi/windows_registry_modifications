@echo off

:: Created by: Shawn Brink
:: Created on: May 27, 2020
:: Tutorial: https://www.tenforums.com/tutorials/153051-turn-off-file-explorer-buttons-easier-touch-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V FileExplorerInTouchImprovement /T REG_DWORD /D 1 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe
