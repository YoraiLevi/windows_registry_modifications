@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/7078-navigation-pane-show-all-folders-turn-off-windows-10-a.html 
 

REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V NavPaneShowAllFolders /T REG_DWORD /D 00000001 /F


taskkill /f /im explorer.exe

start explorer.exe