@echo off

:: Created by: Shawn Brink
:: Created on: October 8, 2021
:: Tutorial: https://www.elevenforum.com/t/add-or-remove-cast-to-device-context-menu-in-windows-11.1778/


REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /V {7AD84985-87B4-4a16-BE58-8B72A5B390F7} /T REG_SZ /D "Play to Menu" /F

taskkill /f /im explorer.exe
start explorer.exe
