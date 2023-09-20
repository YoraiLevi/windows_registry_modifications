@echo off 

:: Created by: Shawn Brink
:: Created on: July 15th 2016
:: Tutorial: https://www.tenforums.com/tutorials/23504-restore-default-location-personal-folders-windows-10-a.html


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\3D Objects" mkdir "%UserProfile%\3D Objects"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_SZ /d "C:\Users\%USERNAME%\3D Objects" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\3D Objects" /f

attrib +r -s -h "%USERPROFILE%\3D Objects" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe



