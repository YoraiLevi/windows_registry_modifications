@echo off

:: Created by: Shawn Brink
:: Created on: November 9th 2016
:: Tutorial: http://www.tenforums.com/tutorials/69380-touchpad-button-taskbar-hide-show-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Touchpad" /V TouchpadDesiredVisibility /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe