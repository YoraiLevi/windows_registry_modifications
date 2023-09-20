@echo off

:: Created by: Shawn Brink
:: Created on: March 19, 2022
:: Tutorial: https://www.elevenforum.com/t/enable-or-disable-search-the-web-with-bing-in-windows-11.5309/

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /V BingSearchEnabled /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe