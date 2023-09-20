@echo off

:: Created by: Shawn Brink
:: Created on: December 13, 2022
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-hide-empty-drives-in-windows-11.11141/


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Hidden /T REG_DWORD /D 0 /F

REG Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V NavPaneShowAllFolders /T REG_DWORD /D 0 /F

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V HideDrivesWithNoMedia /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe