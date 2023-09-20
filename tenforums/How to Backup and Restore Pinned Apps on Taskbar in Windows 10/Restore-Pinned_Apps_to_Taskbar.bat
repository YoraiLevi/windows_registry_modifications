:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/3157-taskbar-pinned-apps-backup-restore-windows-10-a.html


DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"

copy /y "%userprofile%\Desktop\Taskbar-Pinned-Apps-Backup\TaskBar" "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" 

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F

REG IMPORT "%userprofile%\Desktop\Taskbar-Pinned-Apps-Backup\Taskbar-Pinned-Apps-Backup.reg"

taskkill /f /im explorer.exe

start explorer.exe