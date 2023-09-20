:: Created by: Shawn Brink
:: Created on: May 17th 2017
:: Tutorial: https://www.tenforums.com/tutorials/84725-turn-off-play-shoulder-tap-sound-people-bar-windows-10-a.html


REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People\ShoulderTap" /V ShoulderTapAudio /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe