:: This script was created by Matthew Wai on TenForums at http://www.tenforums.com
:: http://www.tenforums.com/tutorials/16236-add-create-restore-point-context-menu-windows-10-a.html
:: ************************************************************************************/
@echo off & mode con cols=86 lines=22 & color 17
Set "Variable=0" & if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"
fsutil dirty query %systemdrive%  >nul 2>&1 && goto :(Privileges_got)
If "%1"=="%Variable%" (echo. &echo. Please right-click on the file and select &echo. "Run as administrator". &echo. Press any key to exit. &pause>nul 2>&1& exit)
cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "%~0", "%Variable%", "", "runas", 1 > "%temp%\getadmin.vbs"&cscript //nologo "%temp%\getadmin.vbs" & exit
:(Privileges_got)
:: ************************************************************************************/
cd /d "%~dp0"
Set "【Item】=Create a restore point"
Set "【Name】=Create_a_restore_point"
Set "【Path】=%ProgramData%\TenForums.com\Create_a_restore_point.cmd"
If not exist "%ProgramData%\TenForums.com\" (mkdir "%ProgramData%\TenForums.com\")

(echo @echo off & echo echo. & echo echo      This window will be closed automatically as soon as the operation below has been completed. & echo Powershell.exe -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description """Manually created by %%username%%.""" -RestorePointType "MODIFY_SETTINGS"")> "%【Path】%"

(REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F)
(REG ADD "HKCR\Directory\Background\shell\%【Item】%" /V "Icon" /T REG_SZ /D SystemPropertiesProtection.exe  /F)
(REG Add "HKCR\Directory\Background\shell\%【Item】%\Command" /VE /D "schtasks.exe /run /tn %【Name】%" /F)
If errorlevel 1 (echo.
echo ====================================================================
echo.	
echo     The script has failed to perform the operations.
echo     Press any key to exit.
echo.	        
echo ====================================================================
pause > nul & EXIT)
echo.
echo     The script is creating a new task with highest privileges.
echo     Please wait for a while.
echo.
:: ************************************************************************************/
(wmic useraccount where name='%username%' get SID) > "%temp%\SID.txt"
for /f "usebackq delims=" %%f in (`More "%temp%\SID.txt"`) do set "SID=%%f"
Del "%temp%\SID.txt"

IF EXIST "%temp%\%【Name】%.xml" (DEL "%temp%\%【Name】%.xml")
echo Set X=CreateObject("Scripting.FileSystemObject") >> "%temp%\Task.vbs"
echo Set Z=X.CreateTextFile("%temp%\%【Name】%.xml",True,True)>> "%temp%\Task.vbs"
Set "W=echo Z.writeline "
(	
%W%"<?xml version=""1.0"" encoding=""UTF-16""?>"
%W%"<Task version=""1.4"" xmlns=""http://schemas.microsoft.com/windows/2004/02/mit/task"">"
%W%"<RegistrationInfo>"
%W%"<Date>2000-01-01T00:00:00</Date>"
%W%"<Author>%username%</Author>"
%W%"<Description>To run the application or CMD script as an administrator with no UAC prompt.</Description>"
%W%"</RegistrationInfo>"
%W%"<Triggers />"
%W%"<Principals>"
%W%"<Principal id=""Author"">"
%W%"<UserId>%SID%</UserId>"
%W%"<LogonType>InteractiveToken</LogonType>"
%W%"<RunLevel>HighestAvailable</RunLevel>"
%W%"</Principal>"
%W%"</Principals>"
%W%"<Settings>"
%W%"<MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>"
%W%"<DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>"
%W%"<StopIfGoingOnBatteries>true</StopIfGoingOnBatteries>"
%W%"<AllowHardTerminate>true</AllowHardTerminate>"
%W%"<StartWhenAvailable>false</StartWhenAvailable>"
%W%"<RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>"
%W%"<IdleSettings>"
%W%"<StopOnIdleEnd>true</StopOnIdleEnd>"
%W%"<RestartOnIdle>false</RestartOnIdle>"
%W%"</IdleSettings>"
%W%"<AllowStartOnDemand>true</AllowStartOnDemand>"
%W%"<Enabled>true</Enabled>"
%W%"<Hidden>false</Hidden>"
%W%"<RunOnlyIfIdle>false</RunOnlyIfIdle>"
%W%"<DisallowStartOnRemoteAppSession>false</DisallowStartOnRemoteAppSession>"
%W%"<UseUnifiedSchedulingEngine>true</UseUnifiedSchedulingEngine>"
%W%"<WakeToRun>false</WakeToRun>"
%W%"<ExecutionTimeLimit>PT72H</ExecutionTimeLimit>"
%W%"<Priority>7</Priority>"
%W%"</Settings>"
%W%"<Actions Context=""Author"">"
%W%"<Exec>"
%W%"<Command>""%【Path】%""</Command>"
%W%"</Exec>"
%W%"</Actions>"
%W%"</Task>"
)>> "%temp%\Task.vbs"
echo Z.Close >> "%temp%\Task.vbs"
"%temp%\Task.vbs"
Del "%temp%\Task.vbs"
schtasks /create /xml "%temp%\%【Name】%.xml" /tn "%【Name】%"
If errorlevel 1 (DEL "%temp%\%【Name】%.xml" & echo.
echo  ====================================================================================
echo      The script has failed to create the task.
echo      The name "%【Name】%" might already be used in Task Scheduler.
echo      Press any key to close this message.
echo  ====================================================================================
pause > nul & Exit) else (DEL "%temp%\%【Name】%.xml")
:: ************************************************************************************/
(echo.
echo ====================================================================
echo.	
echo     The script has completed the operations.
echo     You will see "%【Item】%" in the context menu.
echo     Press any key to exit.
echo.	        
echo ====================================================================
pause > nul & EXIT)