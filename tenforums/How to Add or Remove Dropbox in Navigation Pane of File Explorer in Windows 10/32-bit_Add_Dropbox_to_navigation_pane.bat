@echo off

:: Created by: Shawn Brink
:: Created on: August 11th 2016
:: Tutorial: http://www.tenforums.com/tutorials/59830-dropbox-navigation-pane-add-remove-windows-10-a.html 


REG ADD "HKCU\SOFTWARE\Classes\CLSID\{E31EA727-12ED-4702-820C-4B6445F28E1A}\ShellFolder" /V Attributes /T REG_DWORD /D 4034920525 /F

taskkill /f /im explorer.exe
start explorer.exe
