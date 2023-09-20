@echo off

:: Created by: Shawn Brink
:: Created on: June 12th 2017
:: Tutorial: https://www.tenforums.com/tutorials/86601-enable-disable-system-icons-taskbar-windows-10-a.html


REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V HideSCAPower /F

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V HideSCAPower /F

taskkill /f /im explorer.exe
start explorer.exe