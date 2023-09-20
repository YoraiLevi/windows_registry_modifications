@echo off

:: Created by: Shawn Brink
:: Created on: April 23rd 2016
:: Tutorial: http://www.tenforums.com/tutorials/48186-taskbar-buttons-hide-show-badges-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarBadges /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe