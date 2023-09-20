@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/28436-touch-keyboard-button-taskbar-hide-show-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /V TipbandDesiredVisibility /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe