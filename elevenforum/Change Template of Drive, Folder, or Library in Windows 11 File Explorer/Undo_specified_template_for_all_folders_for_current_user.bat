@echo off

:: Created by: Shawn Brink
:: Created on: September 9, 2021
:: Tutorial: https://www.elevenforum.com/t/change-template-of-drive-folder-or-library-in-windows-11-file-explorer.1259/


Reg Delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /F
Reg Delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /F


:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe

