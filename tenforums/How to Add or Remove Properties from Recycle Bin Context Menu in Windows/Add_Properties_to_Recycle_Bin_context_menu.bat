@echo off

:: Created by: Shawn Brink
:: Created on: November 30th 2017
:: Tutorial: https://www.tenforums.com/tutorials/99269-add-remove-properties-recycle-bin-context-menu-windows.html


REG Delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoPropertiesRecycleBin /F

REG Delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoPropertiesRecycleBin /F

taskkill /f /im explorer.exe
start explorer.exe