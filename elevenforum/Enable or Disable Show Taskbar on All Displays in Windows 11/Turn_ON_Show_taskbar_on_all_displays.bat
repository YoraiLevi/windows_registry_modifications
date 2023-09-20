:: Created by: Shawn Brink
:: Created on: July 8, 2021
:: Tutorial: https://www.elevenforum.com/t/enable-or-disable-show-taskbar-on-all-displays-in-windows-11.468/
 

REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V MMTaskbarEnabled /T REG_dWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe