:: Created by: Shawn Brink
:: Created on: December 31, 2021
:: Tutorial: https://www.elevenforum.com/t/change-where-to-show-taskbar-apps-when-using-multiple-displays-in-windows-11.3682/
 

REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V MMTaskbarEnabled /T REG_dWORD /D 1 /F
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V MMTaskbarMode /T REG_dWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe