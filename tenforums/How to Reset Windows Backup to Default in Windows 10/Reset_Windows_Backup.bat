:: Created by: Shawn Brink
:: Created on: January 21, 2017
:: Updated on: July 12, 2020
:: Tutorial: https://www.tenforums.com/tutorials/75528-reset-windows-backup-default-windows-10-a.html


Reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsBackup /F

Reg Add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsBackup

schtasks /delete /tn "Microsoft\Windows\WindowsBackup\AutomaticBackup" /F

schtasks /delete /tn "Microsoft\Windows\WindowsBackup\Windows Backup Monitor" /F

