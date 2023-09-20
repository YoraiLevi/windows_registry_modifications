@echo off

:: Created by: Shawn Brink
:: Created on: November 18, 2021
:: Tutorial: https://www.elevenforum.com/t/show-or-hide-touch-keyboard-icon-on-taskbar-corner-in-windows-11.2866/


REG ADD "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /V TipbandDesiredVisibility /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe