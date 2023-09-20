:: Created by: Shawn Brink
:: Created on: July 28, 2021
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-use-check-boxes-to-select-items-in-windows-11.764/


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V AutoCheckSelect /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe