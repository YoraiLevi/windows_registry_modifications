@echo off 

:: Created by: Shawn Brink
:: Created on: September 4, 2022
:: Tutorial: https://www.elevenforum.com/t/move-or-restore-default-location-of-searches-folder-in-windows-11.8718/


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Searches" mkdir "%UserProfile%\Searches"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /t REG_SZ /d "C:\Users\%USERNAME%\Searches" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Searches" /f

attrib +r -s -h "%USERPROFILE%\Searches" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe