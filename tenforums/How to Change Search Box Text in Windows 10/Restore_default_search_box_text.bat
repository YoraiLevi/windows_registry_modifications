@echo off

:: Created by: Shawn Brink
:: Created on: October 15th 2016
:: Updated on: July 14th 2019
:: Tutorial: https://www.tenforums.com/tutorials/67100-change-search-box-text-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\0\SearchBoxText" /v Value /t REG_SZ /d "Type here to search" /F

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\1\SearchBoxText" /v Value /t REG_SZ /d "Type here to search" /F

taskkill /f /im explorer.exe
start explorer.exe
