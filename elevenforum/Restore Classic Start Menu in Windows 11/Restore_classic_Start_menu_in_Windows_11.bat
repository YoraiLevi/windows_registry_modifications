@echo off

:: Created by: Shawn Brink
:: Created on: June 17, 2021
:: Tutorial: https://www.elevenforum.com/t/restore-classic-start-menu-in-windows-11.30/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Start_ShowClassicMode /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe