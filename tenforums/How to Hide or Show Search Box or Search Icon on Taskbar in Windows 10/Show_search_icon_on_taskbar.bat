@echo off

:: Created by: Shawn Brink
:: Created on: May 9th 2016
:: Updated on: May 4th 2019
:: Tutorial: https://www.tenforums.com/tutorials/2854-hide-show-search-box-search-icon-taskbar-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /V SearchboxTaskbarMode /T REG_DWORD /D 1 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe