:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: http://www.tenforums.com/tutorials/64791-automatically-create-system-restore-point-startup-windows-10-a.html
:: ************************************************************************************
@echo off & Title Create System Restore Point at Startup & mode con cols=103 lines=13 & color 17
(Net session >nul 2>&1)&&(cd /d "%~dp0")||(PowerShell start """%~0""" -verb RunAs & Exit /B)
::===================================================================================
@ECHO OFF 
echo.
echo           The script is creating an elevated task with highest privileges.
echo           Please wait for a while.
echo.
:: ************************************************************************************/
(REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F)>nul
Set "【Command】=PowerShell"	
Set "【Arguments】=-ExecutionPolicy Bypass -Command ""Checkpoint-Computer -Description \""Automatic Restore Point\"" -RestorePointType \""MODIFY_SETTINGS\"""""	
Set "【VBS】=%temp%\Task.vbs"
If exist "%【VBS】%" (Del "%【VBS】%")
Set "【XML】=%temp%\Task.xml"			
IF EXIST "%【XML】%" (DEL "%【XML】%")	
Set "【Task】=TenForums\Create Restore Point at Startup"
For /f "tokens=*" %%# in ('WhoAmI /user') Do (for %%+ in (%%~#) Do (set "【SID】=%%+"))
echo Set X=CreateObject("Scripting.FileSystemObject") >> "%【VBS】%"
echo Set Z=X.CreateTextFile("%【XML】%",True,True)>> "%【VBS】%"
Set "W=echo Z.writeline "
(
%W%"<?xml version=""1.0"" encoding=""UTF-16""?>"
%W%"<Task version=""1.4"" xmlns=""http://schemas.microsoft.com/windows/2004/02/mit/task"">"
%W%"<RegistrationInfo>"
%W%"<Author>%Username%</Author>"
%W%"</RegistrationInfo>"
%W%"<Triggers>"
%W%"<BootTrigger>"
%W%"<Enabled>true</Enabled>"
%W%"</BootTrigger>"
%W%"</Triggers>"
%W%"<Principals>"
%W%"<Principal id=""Author"">"
%W%"<UserId>%【SID】%</UserId>"
%W%"<LogonType>Password</LogonType>"
%W%"<RunLevel>HighestAvailable</RunLevel>"
%W%"</Principal>"
%W%"</Principals>"
%W%"<Settings>"
%W%"<MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>"
%W%"<DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>"
%W%"<StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>"
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
%W%"<Command>%【Command】%</Command>"
%W%"<Arguments>%【Arguments】%</Arguments>"
%W%"</Exec>"
%W%"</Actions>"
%W%"</Task>"
)>> "%【VBS】%"
echo Z.Close >> "%【VBS】%" & "%【VBS】%"
Del "%【VBS】%"
Schtasks /create /xml "%【XML】%" /Tn "%【Task】%" /RU "%Computername%\%Username%"
If %errorlevel%==1 (DEL "%【XML】%" & echo.
echo        ====================================================================================
echo           The script has failed to create the task "Create Restore Point at Startup".
echo           You might have entered an incorrect password. Otherwise, the task might already
echo           exist in "Task Scheduler Library"--^>"TenForums". Please check it out and then
echo           re-run this script. Press any key to close this message. 
echo        ====================================================================================
pause > nul & Exit) else (DEL "%【XML】%"
echo       =============================================================================================
echo          The task "Create Restore Point at Startup" is in "Task Scheduler Library"--^>"TenForums".
echo          You may edit/disable/delete the task if need be.
echo          Please press any key to close this message.
echo       =============================================================================================
pause > nul & Exit)
