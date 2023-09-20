:: Created by: Shawn Brink
:: Created on: October 22nd 2016
:: Tutorial: http://www.tenforums.com/tutorials/67661-taskbar-toolbars-reset-clear-windows-10-a.html
 

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Desktop /F

taskkill /f /im explorer.exe

start explorer.exe