:: Created by: Shawn Brink
:: Created on: March 15, 2022
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-nearby-sharing-in-windows-11.2644/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /V NearShareChannelUserAuthzPolicy /T REG_DWORD /D 3 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP\SettingsPage" /V NearShareChannelUserAuthzPolicy /T REG_DWORD /D 3 /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /V CdpSessionUserAuthzPolicy /T REG_DWORD /D 3 /F

taskkill /f /im explorer.exe
start explorer.exe
