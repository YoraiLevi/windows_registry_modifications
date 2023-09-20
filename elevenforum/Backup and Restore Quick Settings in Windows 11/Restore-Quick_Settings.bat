:: Created by: Shawn Brink
:: Created on: February 21, 2023
:: Tutorial: https://www.elevenforum.com/t/backup-and-restore-quick-settings-in-windows-11.12838/


REG DELETE "HKCU\Control Panel\Quick Actions" /F

REG IMPORT "%userprofile%\Desktop\My_Quick_Settings-backup.reg"

taskkill /f /im explorer.exe

start explorer.exe