@echo off

:: Created by: Shawn Brink
:: Created on: September 10, 2022
:: Tutorial: https://www.elevenforum.com/t/clear-microphone-last-accessed-history-in-windows-11.8831/


:: Clear Microsoft Store apps last accessed history
Powershell -Command "Get-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\* | Remove-ItemProperty -Name LastUsedTimeStart -ErrorAction SilentlyContinue"

Powershell -Command "Get-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\* | Remove-ItemProperty -Name LastUsedTimeStop -ErrorAction SilentlyContinue"


:: Clear desktop apps last accessed history
Powershell -Command "Get-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged\* | Remove-Item -Recurse -Force"