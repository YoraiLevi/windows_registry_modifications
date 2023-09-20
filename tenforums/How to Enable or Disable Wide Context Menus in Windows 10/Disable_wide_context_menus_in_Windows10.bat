:: Created by: Shawn Brink
:: Created on: July 24th 2017
:: Tutorial: https://www.tenforums.com/tutorials/89738-enable-disable-wide-context-menus-windows-10-a.html


@echo off
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures" /V ImmersiveContextMenu /T REG_DWORD /D 0 /F' -Verb runAs"

taskkill /f /im explorer.exe
start explorer.exe
