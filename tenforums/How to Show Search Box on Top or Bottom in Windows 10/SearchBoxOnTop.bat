@echo off

:: Created by: Shawn Brink
:: Created on: October 15th 2016
:: Updated on July 14th 2019
:: Tutorial: https://www.tenforums.com/tutorials/67041-show-search-box-top-bottom-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\0\SearchBoxOnTop" /V Value /T REG_DWORD /D 1 /F

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\1\SearchBoxOnTop" /V Value /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe
