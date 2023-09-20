@echo off

:: Created by: Shawn Brink
:: Created on: June 12th 2017
:: Tutorial: https://www.tenforums.com/tutorials/86654-add-remove-notification-area-taskbar-windows-10-a.html


@echo off
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoTrayItemsDisplay /F & REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoTrayItemsDisplay /F & taskkill /f /im explorer.exe & start explorer.exe' -Verb runAs"


