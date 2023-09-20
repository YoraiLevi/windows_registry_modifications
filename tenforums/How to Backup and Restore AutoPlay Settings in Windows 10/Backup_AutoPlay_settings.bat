:: Created by: Shawn Brink
:: Created on: June 10th 2018
:: Tutorial: https://www.tenforums.com/tutorials/111934-backup-restore-autoplay-settings-windows-10-a.html


:: To create "AutoPlay Settings Backup" folder on your desktop.
mkdir "%userprofile%\Desktop\AutoPlay Settings Backup"


:: To export these two registry keys to .reg files into the "AutoPlay Settings Backup" folder on your desktop.
REG EXPORT HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection "%userprofile%\Desktop\AutoPlay Settings Backup\EventHandlersDefaultSelection.reg"

REG EXPORT HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers "%userprofile%\Desktop\AutoPlay Settings Backup\UserChosenExecuteHandlers.reg"