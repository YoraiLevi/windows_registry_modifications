@echo off

:: Created by: Shawn Brink
:: Created on: November 29th 2017
:: Tutorial: https://www.tenforums.com/tutorials/99205-set-alt-tab-use-classic-icons-thumbnails-windows.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /V AltTabSettings /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe