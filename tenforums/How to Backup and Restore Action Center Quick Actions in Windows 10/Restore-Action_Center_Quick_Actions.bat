:: Created by: Shawn Brink
:: Created on: November 26, 2020
:: Tutorial: https://www.tenforums.com/tutorials/45158-backup-restore-action-center-quick-actions-windows-10-a.html


REG DELETE "HKCU\Control Panel\Quick Actions" /F

REG IMPORT "%userprofile%\Desktop\Action_Center_quick_actions-backup.reg"

taskkill /f /im explorer.exe

start explorer.exe