@echo off

:: Created by: Shawn Brink
:: Created on: April 28th 2016
:: Tutorial: http://www.tenforums.com/tutorials/48645-taskbar-app-icons-tablet-mode-hide-show-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarAppsVisibleInTabletMode /T REG_DWORD /D 1 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe
