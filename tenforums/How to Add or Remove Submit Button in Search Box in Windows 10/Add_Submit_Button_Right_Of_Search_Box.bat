@echo off

:: Created by: Shawn Brink
:: Created on: October 15th 2016
:: Updated on July 14th 2019
:: Tutorial: https://www.tenforums.com/tutorials/67048-add-remove-submit-button-search-box-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\0\ShowSubmitButtonRightOfSearchBox" /V Value /T REG_DWORD /D 1 /F

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\Flighting\1\ShowSubmitButtonRightOfSearchBox" /V Value /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe
