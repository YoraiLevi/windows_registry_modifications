@echo off
:: Created by: Shawn Brink
:: Created on: April 4, 2022
:: Tutorial: https://www.elevenforum.com/t/add-or-remove-bluetooth-notification-icon-on-taskbar-in-windows-11.5661/
 

REG ADD "HKCU\Control Panel\Bluetooth" /V "Notification Area Icon" /T REG_DWORD /D 00000001 /F

taskkill /f /im explorer.exe
start explorer.exe