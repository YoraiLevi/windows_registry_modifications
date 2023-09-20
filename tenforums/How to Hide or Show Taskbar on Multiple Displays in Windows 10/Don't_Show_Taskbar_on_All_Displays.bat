:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/3899-taskbar-hide-show-multiple-displays-windows-10-a.html
 

REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V MMTaskbarEnabled /T REG_dWORD /D 0 /F


taskkill /f /im explorer.exe

start explorer.exe