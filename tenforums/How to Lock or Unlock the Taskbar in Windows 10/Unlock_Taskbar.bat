:: Created by: Shawn Brink
:: Created on: June 15th 2016
:: Tutorial: http://www.tenforums.com/tutorials/53449-taskbar-lock-unlock-windows-10-a.html 
 

REG Add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V TaskbarSizeMove /T REG_DWORD /D 00000001 /F


taskkill /f /im explorer.exe

start explorer.exe