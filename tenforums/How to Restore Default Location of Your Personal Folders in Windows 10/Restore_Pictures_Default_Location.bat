@echo off 

:: Created by: Shawn Brink
:: http://www.stenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/23504-users-personal-folders-restore-default-location-windows-10-a.html


taskkill /f /im explorer.exe

timeout /t 2 /nobreak>null

if not exist "%UserProfile%\Pictures" mkdir "%UserProfile%\Pictures"

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "C:\Users\%USERNAME%\Pictures" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Pictures" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Pictures" /f

attrib +r -s -h "%USERPROFILE%\Pictures" /S /D

timeout /t 1 /nobreak>null

start explorer.exe
