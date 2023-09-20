@echo off

:: Created by: Shawn Brink
:: Created on: March 2, 2022
:: Tutorial: https://www.elevenforum.com/t/show-hidden-files-folders-and-drives-in-windows-11.4962/


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Hidden /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe