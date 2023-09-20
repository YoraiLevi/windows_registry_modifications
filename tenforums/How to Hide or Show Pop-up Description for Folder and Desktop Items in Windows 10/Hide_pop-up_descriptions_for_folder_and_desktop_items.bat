@echo off

:: Created by: Shawn Brink
:: Created on: July 18th 2017
:: Tutorial: https://www.tenforums.com/tutorials/89239-hide-show-pop-up-descriptions-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V ShowInfoTip /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe