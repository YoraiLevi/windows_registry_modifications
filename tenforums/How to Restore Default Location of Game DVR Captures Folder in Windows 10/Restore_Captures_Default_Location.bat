@echo off 

:: Created by: Shawn Brink
:: Created on: September 7, 2020
:: Tutorial: https://www.tenforums.com/tutorials/87525-restore-default-location-game-dvr-captures-folder-windows-10-a.html


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Videos\Captures" mkdir "%UserProfile%\Videos\Captures"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{EDC0FE71-98D8-4F4A-B920-C8DC133CB165}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Videos\Captures" /f

attrib +r -s -h "%USERPROFILE%\Videos\Captures" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe
