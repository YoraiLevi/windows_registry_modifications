@echo off

:: Created by: Shawn Brink
:: Created on: June 18, 2021
:: Tutorial: https://www.elevenforum.com/t/change-size-of-taskbar-icons-in-windows-11.45/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarSi /T REG_DWORD /D 2 /F

taskkill /f /im explorer.exe
start explorer.exe