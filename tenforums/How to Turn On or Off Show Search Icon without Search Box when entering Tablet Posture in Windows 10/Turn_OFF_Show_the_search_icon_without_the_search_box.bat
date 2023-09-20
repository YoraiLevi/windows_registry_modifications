@echo off

:: Created by: Shawn Brink
:: Created on: May 26, 2020
:: Tutorial: https://www.tenforums.com/tutorials/153002-turn-off-search-icon-without-search-box-windows-10-tablet.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V SearchBoxVisibleInTouchImprovement /T REG_DWORD /D 1 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe
