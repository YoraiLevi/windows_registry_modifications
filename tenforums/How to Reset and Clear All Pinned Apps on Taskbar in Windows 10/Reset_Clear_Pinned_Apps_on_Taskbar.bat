:: Created by: Shawn Brink
:: Created on: December 3rd 2014
:: Tutorial: https://www.tenforums.com/tutorials/3151-reset-clear-taskbar-pinned-apps-windows-10-a.html


DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F

taskkill /f /im explorer.exe

start explorer.exe