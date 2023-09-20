:: Created by: Shawn Brink
:: Created on: November 9, 2021
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-nearby-sharing-in-windows-11.2644/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /V NearShareChannelUserAuthzPolicy /T REG_DWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP\SettingsPage" /V NearShareChannelUserAuthzPolicy /T REG_DWORD /D 1 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /V CdpSessionUserAuthzPolicy /T REG_DWORD /D 1 /F


taskkill /f /im explorer.exe
start explorer.exe
