@echo off 

:: Created by: Shawn Brink
:: Created on: September 3, 2022
:: Tutorial: https://www.elevenforum.com/t/move-or-restore-default-location-of-desktop-folder-in-windows-11.8714/


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Desktop" mkdir "%UserProfile%\Desktop"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop" /t REG_SZ /d "C:\Users\%USERNAME%\Desktop" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Desktop" /f

attrib +r -s -h "%USERPROFILE%\Desktop" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe