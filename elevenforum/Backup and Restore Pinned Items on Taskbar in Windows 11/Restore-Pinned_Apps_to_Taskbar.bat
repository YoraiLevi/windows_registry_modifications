:: Created by: Shawn Brink
:: Created on: December 29, 2021
:: Tutorial: https://www.elevenforum.com/t/backup-and-restore-pinned-items-on-taskbar-in-windows-11.3630/


DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"

copy /y "%userprofile%\Desktop\Taskbar-Pinned-Items-Backup\TaskBar" "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" 

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F

REG IMPORT "%userprofile%\Desktop\Taskbar-Pinned-Items-Backup\Taskbar-Pinned-Items-Backup.reg"

taskkill /f /im explorer.exe

start explorer.exe