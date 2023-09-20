@echo off

:: Created by: Shawn Brink
:: Created on: March 7th 2017
:: Tutorial: https://www.tenforums.com/tutorials/78839-clear-live-tile-cache-start-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\StateStore" /V ResetCache /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe