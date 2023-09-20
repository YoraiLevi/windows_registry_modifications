@echo off

:: Created by: Shawn Brink
:: Created on: January 24th 2015
:: Tutorial: https://www.tenforums.com/tutorials/3680-start-full-screen-turn-off-windows-10-a.html


REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V ForceStartSize /T REG_DWORD /D 2 /F

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ForceStartSize /T REG_DWORD /D 2 /F

taskkill /f /im explorer.exe
start explorer.exe