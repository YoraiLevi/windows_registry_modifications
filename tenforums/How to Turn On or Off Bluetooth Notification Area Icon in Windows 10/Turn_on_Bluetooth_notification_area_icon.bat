:: Created by: Shawn Brink
:: Created on: October 10th 2017
:: Tutorial: https://www.tenforums.com/tutorials/95222-turn-off-bluetooth-notification-area-icon-windows-10-a.html
 

REG ADD "HKCU\Control Panel\Bluetooth" /V "Notification Area Icon" /T REG_DWORD /D 00000001 /F


taskkill /f /im explorer.exe

start explorer.exe