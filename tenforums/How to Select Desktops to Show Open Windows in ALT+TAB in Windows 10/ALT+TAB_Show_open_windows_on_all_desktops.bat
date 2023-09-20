:: Created by: Shawn Brink
:: www.tenforums.com
:: Tutorial: https://www.tenforums.com/tutorials/4764-alt-tab-show-windows-open-desktops-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V VirtualDesktopAltTabFilter /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe