@echo off

:: Created by: Shawn Brink
:: Created on: September 19th 2016
:: Tutorial: http://www.tenforums.com/tutorials/64249-drive-letters-show-before-after-name-windows-10-a.html


REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V ShowDriveLettersFirst /T REG_DWORD /D 4 /F

taskkill /f /im explorer.exe
start explorer.exe