@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com/
:: Tutorial: http://www.tenforums.com/tutorials/5556-start-menu-taskbar-transparency-turn-off-windows-10-a.html


Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

taskkill /f /im explorer.exe
start explorer.exe
