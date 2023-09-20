@echo off

:: Created by: Shawn Brink
:: Created on: February 22, 2022
:: Tutorial: https://www.elevenforum.com/t/change-size-of-desktop-icons-in-windows-11.4820/


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V IconSize /T REG_DWORD /D 96 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V Mode /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /V LogicalViewMode /T REG_DWORD /D 3 /F

taskkill /f /im explorer.exe
start explorer.exe
