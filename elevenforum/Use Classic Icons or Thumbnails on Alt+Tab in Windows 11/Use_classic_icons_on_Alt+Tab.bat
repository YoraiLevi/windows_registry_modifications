@echo off

:: Created by: Shawn Brink
:: Created on: January 7, 2022
:: Tutorial: https://www.elevenforum.com/t/use-classic-icons-or-thumbnails-on-alt-tab-in-windows-11.3840/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /V AltTabSettings /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe