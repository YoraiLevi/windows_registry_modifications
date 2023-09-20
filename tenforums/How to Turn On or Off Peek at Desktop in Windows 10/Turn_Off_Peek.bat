@echo off

:: Created by: Shawn Brink
:: Created on: April 14th 2016
:: Updated on: May 23rd 2019
:: Tutorial: https://www.tenforums.com/tutorials/47266-turn-off-peek-desktop-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisablePreviewDesktop /T REG_DWORD /D 1 /F

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\DWM" /V EnableAeroPeek /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe