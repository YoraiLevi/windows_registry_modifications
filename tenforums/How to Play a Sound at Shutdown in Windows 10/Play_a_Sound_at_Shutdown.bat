:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: http://www.tenforums.com/tutorials/94891-play-sound-shutdown-windows-10-a.html
:: ************************************************************************************
@echo off & Title Play a Sound at Shutdown & mode con cols=90 lines=19 & color 17
(Net session >nul 2>&1)&&(cd /d "%~dp0")||(PowerShell start """%~0""" -verb RunAs & Exit /B)
::===================================================================================
@ECHO OFF & setlocal
Set "✉=    Please do not leave a space before or after the file path."
echo.
:Enter_the_path
SET /P "【Path】= --> Please key in (or copy and paste) the full path (without quotation marks) of the .wav     sound file you want to be played (for example C:\Windows\Media\Windows Shutdown.wav)      and then press [Enter]: " 

Set "✱=""%【Path】%"""		
Set "(✱)=%✱: ""=""%"		
Set "[✱]=%✱:"" =""%"		
If not "%✱%"=="%(✱)%" (Echo. & Echo %✉% & Echo. & Goto Enter_the_path)
If not "%✱%"=="%[✱]%" (Echo. & Echo %✉% & Echo. & Goto Enter_the_path)
echo.
echo       The script is creating an elevated task with highest privileges.
echo       Please wait for a while.
echo.
:: ************************************************************************************/
Set "【Command】=PowerShell"	
Set "【Arguments】=-c (New-Object Media.SoundPlayer '%【Path】%').PlaySync()"	
Set "【VBS】=%temp%\Task.vbs"
If exist "%【VBS】%" (Del "%【VBS】%")
Set "【XML】=%temp%\Task.xml"			
IF EXIST "%【XML】%" (DEL "%【XML】%")	
Set "【Task】=TenForums\Play shutdown sound"
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
%W%"<EventTrigger>"
%W%"<Enabled>true</Enabled>"
%W%"<Subscription>&lt;QueryList&gt;&lt;Query Id=""0"" Path=""System""&gt;&lt;Select Path=""System""&gt;*[System[EventID=1074]]&lt;/Select&gt;&lt;/Query&gt;&lt;/QueryList&gt;</Subscription>"
%W%"</EventTrigger>"
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
echo    ====================================================================================
echo       The script has failed to create the task "Play shutdown sound".
echo       You might have entered an incorrect password. Otherwise, the task might already
echo       exist in "Task Scheduler Library"--^>"TenForums". Please check it out and then
echo       re-run this script. Press any key to close this message. 
echo    ====================================================================================
pause > nul & Exit) else (DEL "%【XML】%"
echo    ====================================================================================
echo       The task "Play shutdown sound" is in "Task Scheduler Library"--^>"TenForums".
echo       You may edit/disable/delete the task if need be.
echo       Please press any key to close this message.
echo    ====================================================================================
pause > nul & Exit)
