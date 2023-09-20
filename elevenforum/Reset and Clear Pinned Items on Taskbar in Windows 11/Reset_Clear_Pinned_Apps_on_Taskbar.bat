:: Created by: Shawn Brink
:: Created on: December 29, 2021
:: Tutorial: https://www.elevenforum.com/t/reset-and-clear-pinned-items-on-taskbar-in-windows-11.3634/


DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F

taskkill /f /im explorer.exe

start explorer.exe