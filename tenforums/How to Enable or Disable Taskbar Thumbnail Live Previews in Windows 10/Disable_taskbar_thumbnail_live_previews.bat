@echo off

:: Created by: Shawn Brink
:: Created on: September 26th 2019
:: Tutorial: https://www.tenforums.com/tutorials/141305-enable-disable-taskbar-thumbnail-live-previews-windows-10-a.html


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V DisablePreviewWindow /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe