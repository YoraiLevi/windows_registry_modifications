@echo off

:: Created by: Shawn Brink
:: Created on: October 26, 2021
:: Tutorial: https://www.elevenforum.com/t/enable-or-disable-thumbnail-previews-in-file-explorer-in-windows-11.2272/


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V IconsOnly /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe