:: Created by: Shawn Brink
:: Created on: May 17th 2017
:: Tutorial: https://www.tenforums.com/tutorials/84717-turn-off-show-shoulder-taps-people-bar-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People\ShoulderTap" /V ShoulderTap /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe