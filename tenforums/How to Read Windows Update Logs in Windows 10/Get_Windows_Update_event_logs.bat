:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: https://www.tenforums.com/tutorials/67283-read-windows-update-logs-windows-10-a.html
::—————————————————————————————————————————————————————————————————————————————————————
@echo off & mode con cols=75 lines=6 & Title Collecting data from Event Viewer...
Echo.&Echo     Searching Event Viewer for logs about Windows Update. 
Echo     Please wait for a while.
::=====================================================================================
Set "+=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
For /F "tokens=* " %%# in ('Reg Query "%+%" /V Desktop') Do (Set "#=%%#")
Set "#=%#:*REG_EXPAND_SZ    =%"
For /F "delims=" %%# in ('Echo "%#%"') Do (Set "#=%%#")
Set "[Desktop]=%#:~1,-1%" & For /f "tokens=2 delims==" %%# in (
'WMIC OS Get localdatetime /value') Do (Set "T=%%#")
Set "Y=%T:~0,4%" & Set "M=%T:~4,2%" & Set "D=%T:~6,2%"
Set "H=%T:~8,2%" & Set "#=%T:~10,2%" & Set "S=%T:~12,2%"
Set "[File]=%Temp%\Update events %Y%-%M%-%D% at %H%-%#%-%S%.txt"
::=====================================================================================
PowerShell $Host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(220,1000)
PowerShell Get-WinEvent -ProviderName 'Microsoft-Windows-WindowsUpdateClient'^|Select TimeCreated, Message^|FT -AutoSize>"%[File]%"
For %%# in ("%[Desktop]%\Update events*.txt") Do (Del "%%#")
Move "%[File]%" "%[Desktop]%">Nul
PowerShell "Start-Process Notepad.exe ""%[Desktop]%\Update events %Y%-%M%-%D% at %H%-%#%-%S%.txt"""
::—————————————————————————————————————————————————————————————————————————————————————