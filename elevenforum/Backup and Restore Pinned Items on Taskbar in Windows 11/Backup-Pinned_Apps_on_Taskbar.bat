:: Created by: Shawn Brink
:: Created on: December 29, 2021
:: Tutorial: https://www.elevenforum.com/t/backup-and-restore-pinned-items-on-taskbar-in-windows-11.3630/


mkdir "%userprofile%\Desktop\Taskbar-Pinned-Items-Backup\TaskBar"

copy /y "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" "%userprofile%\Desktop\Taskbar-Pinned-Items-Backup\TaskBar"

REG EXPORT HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband "%userprofile%\Desktop\Taskbar-Pinned-Items-Backup\Taskbar-Pinned-Items-Backup.reg" /y