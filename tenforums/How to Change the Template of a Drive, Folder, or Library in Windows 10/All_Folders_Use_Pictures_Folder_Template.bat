@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/7923-folder-template-change-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /V FolderType /T REG_SZ /D Pictures /F


:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe

