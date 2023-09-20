@echo off

:: Created by: Shawn Brink
:: Created on: December 26, 2021
:: Tutorial: https://www.elevenforum.com/t/display-full-path-in-title-bar-of-file-explorer-in-windows-11.3585/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /V FullPath /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe