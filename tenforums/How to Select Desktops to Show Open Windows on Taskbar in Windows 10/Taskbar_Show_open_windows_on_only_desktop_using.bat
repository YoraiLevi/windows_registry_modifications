:: Created by: Shawn Brink
:: www.tenforums.com
:: Tutorial: https://www.tenforums.com/tutorials/4751-taskbar-show-windows-open-desktops-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V VirtualDesktopTaskbarFilter /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe