:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/6108-screenshot-index-counter-reset-windows-10-a.html



REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /V ScreenshotIndex /T REG_DWORD /D 1 /F

