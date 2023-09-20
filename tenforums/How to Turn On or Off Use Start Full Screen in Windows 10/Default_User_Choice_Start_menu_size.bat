@echo off

:: Created by: Shawn Brink
:: Created on: January 24th 2015
:: Tutorial: https://www.tenforums.com/tutorials/3680-start-full-screen-turn-off-windows-10-a.html


REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Explorer" /V ForceStartSize /F

REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ForceStartSize /F

taskkill /f /im explorer.exe
start explorer.exe