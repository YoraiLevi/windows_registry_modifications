@echo off

:: Created by: Shawn Brink
:: Created on: November 5, 2021
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-show-all-folders-in-navigation-pane-of-file-explorer-in-windows-11.2535/
 

REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V NavPaneShowAllFolders /T REG_DWORD /D 00000000 /F


taskkill /f /im explorer.exe

start explorer.exe