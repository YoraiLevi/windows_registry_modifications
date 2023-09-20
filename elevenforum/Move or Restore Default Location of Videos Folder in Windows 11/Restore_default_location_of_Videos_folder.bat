@echo off 

:: Created by: Shawn Brink
:: Created on: September 3, 2022
:: Tutorial: https://www.elevenforum.com/t/move-or-restore-default-location-of-videos-folder-in-windows-11.8713/


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Videos" mkdir "%UserProfile%\Videos"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "C:\Users\%USERNAME%\Videos" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Videos" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Videos" /f

attrib +r -s -h "%USERPROFILE%\Videos" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe