:: Created by: Shawn Brink
:: Created on: August 22, 2021
:: Tutorial: https://www.elevenforum.com/t/show-all-open-windows-on-taskbar-for-current-or-all-desktops-in-windows-11.1053/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V VirtualDesktopTaskbarFilter /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe