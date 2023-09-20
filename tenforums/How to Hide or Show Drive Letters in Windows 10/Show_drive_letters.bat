@echo off

:: Created by: Shawn Brink
:: Created on: July 17th 2017
:: Tutorial: https://www.tenforums.com/tutorials/89169-hide-show-drive-letters-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V ShowDriveLettersFirst /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe