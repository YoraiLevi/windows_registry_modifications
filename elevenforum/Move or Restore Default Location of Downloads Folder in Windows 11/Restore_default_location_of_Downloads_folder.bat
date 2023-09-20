@echo off 

:: Created by: Shawn Brink
:: Created on: September 3, 2022
:: Tutorial: https://www.elevenforum.com/t/move-or-restore-default-location-of-downloads-folder-in-windows-11.8710/


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Downloads" mkdir "%UserProfile%\Downloads"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\Users\%USERNAME%\Downloads" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Downloads" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Downloads" /f

attrib +r -s -h "%USERPROFILE%\Downloads" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe