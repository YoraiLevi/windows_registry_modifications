@echo off

:: Created by: Shawn Brink
:: Created on: May 16, 2022
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-align-icons-to-grid-on-desktop-in-windows-11.6514/


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V FFLAGS /T REG_DWORD /D 1075839520 /F

taskkill /f /im explorer.exe
start explorer.exe
