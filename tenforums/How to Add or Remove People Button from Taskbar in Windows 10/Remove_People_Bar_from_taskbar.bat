:: Created by: Shawn Brink
:: Created on: April 28th 2017
:: Tutorial: https://www.tenforums.com/tutorials/83096-add-remove-people-bar-icon-taskbar-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /V PeopleBand /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe