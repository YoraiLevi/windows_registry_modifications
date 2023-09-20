@echo off 

:: Created by: Shawn Brink
:: Created on: September 3, 2022
:: Tutorial: https://www.elevenforum.com/t/move-or-restore-default-location-of-pictures-folder-in-windows-11.8711/


taskkill /f /im explorer.exe

timeout /t 2 /nobreak>null

if not exist "%UserProfile%\Pictures" mkdir "%UserProfile%\Pictures"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "C:\Users\%USERNAME%\Pictures" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Pictures" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Pictures" /f

attrib +r -s -h "%USERPROFILE%\Pictures" /S /D

timeout /t 1 /nobreak>null

start explorer.exe