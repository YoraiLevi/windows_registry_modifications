@echo off 

:: Created by: Shawn Brink
:: Created on: September 4, 2022
:: Tutorial: https://www.elevenforum.com/t/move-or-restore-default-location-of-saved-games-folder-in-windows-11.8717/


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Saved Games" mkdir "%UserProfile%\Saved Games"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\Users\%USERNAME%\Saved Games" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Saved Games" /f

attrib +r -s -h "%USERPROFILE%\Saved Games" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe