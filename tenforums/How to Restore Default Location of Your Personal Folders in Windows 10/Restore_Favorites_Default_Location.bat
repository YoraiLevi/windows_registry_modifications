@echo off 

:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/23504-users-personal-folders-restore-default-location-windows-10-a.html


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

if not exist "%UserProfile%\Favorites" mkdir "%UserProfile%\Favorites"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Favorites" /t REG_SZ /d "C:\Users\%USERNAME%\Favorites" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Favorites" /f

attrib +r -s -h "%USERPROFILE%\Favorites" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe
