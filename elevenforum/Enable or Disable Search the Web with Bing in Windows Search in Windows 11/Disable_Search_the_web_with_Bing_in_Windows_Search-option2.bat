@echo off

:: Created by: Shawn Brink
:: Created on: March 20, 2022
:: Tutorial: https://www.elevenforum.com/t/enable-or-disable-search-the-web-with-bing-in-windows-11.5309/

powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG Add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_DWORD /D 1 /F' -Verb runAs"

taskkill /f /im explorer.exe
start explorer.exe