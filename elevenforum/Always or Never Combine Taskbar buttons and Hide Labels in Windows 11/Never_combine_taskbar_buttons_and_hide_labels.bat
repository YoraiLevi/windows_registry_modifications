:: Created by: Shawn Brink
:: Created on: May 24, 2023
:: Tutorial: https://www.elevenforum.com/t/always-or-never-combine-taskbar-buttons-and-hide-labels-in-windows-11.15135/


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarGlomLevel /T REG_DWORD /D 2 /F

taskkill /f /im explorer.exe
start explorer.exe