:: This script was created by Matthew Wai on TenForums at http://www.tenforums.com
:: http://www.tenforums.com/tutorials/16236-add-create-restore-point-context-menu-windows-10-a.html
:: ************************************************************************************/
@echo off & mode con cols=16 lines=1 & color 17
Set "Variable=0" & if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"
fsutil dirty query %systemdrive%  >nul 2>&1 && goto :(Privileges_got)
If "%1"=="%Variable%" (echo. &echo. Please right-click on the file and select &echo. "Run as administrator". &echo. Press any key to exit. &pause>nul 2>&1& exit)
cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "%~0", "%Variable%", "", "runas", 1 > "%temp%\getadmin.vbs"&cscript //nologo "%temp%\getadmin.vbs" & exit
:(Privileges_got)
:: ************************************************************************************/
cd /d "%~dp0"
Reg delete "HKCR\Directory\Background\shell\Create a restore point" /f
Schtasks /delete /tn "Create_a_restore_point" /f
Del "%ProgramData%\TenForums.com\Create_a_restore_point.cmd"
RmDir "%ProgramData%\TenForums.com\"