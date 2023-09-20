:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/3157-taskbar-pinned-apps-backup-restore-windows-10-a.html


mkdir "%userprofile%\Desktop\Taskbar-Pinned-Apps-Backup\TaskBar"

copy /y "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" "%userprofile%\Desktop\Taskbar-Pinned-Apps-Backup\TaskBar"

REG EXPORT HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband "%userprofile%\Desktop\Taskbar-Pinned-Apps-Backup\Taskbar-Pinned-Apps-Backup.reg" /y