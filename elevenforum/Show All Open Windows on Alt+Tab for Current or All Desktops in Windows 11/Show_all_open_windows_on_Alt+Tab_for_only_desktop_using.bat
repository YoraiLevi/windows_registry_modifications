:: Created by: Shawn Brink
:: Created on: August 23, 2021
:: Tutorial: https://www.elevenforum.com/t/show-all-open-windows-on-alt-tab-for-current-or-all-desktops-in-windows-11.1060/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V VirtualDesktopAltTabFilter /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe