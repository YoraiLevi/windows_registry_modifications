@echo off
:: ###############################################################################################################################
:: # Title     : Enable or Disable NTFS Last Access Time Stamp Updates                                                           #
:: # Created By: Paul Black at TenForums.com/members/paul-black.html                                                             #
:: # Created On: 30-May-2021                                                                                                     #
:: # Tutorial  : https://www.tenforums.com/tutorials/139015-enable-disable-ntfs-last-access-time-stamp-updates-windows-10-a.html #
:: ###############################################################################################################################
title Enable or Disable NTFS Last Access Time Stamp Updates - Written by Paul Black.
mode con: cols=92 lines=29 & color 17

setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%Temp%\getadmin.vbs" del "%Temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%Temp%\getadmin.vbs" && "%Temp%\getadmin.vbs" && Exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERROR: This Batch file MUST be run in an ELEVATED cmd prompt [ Administrator ] & echo. & echo         Right-click the Batch file and click ^<Run as Administrator^>. & echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & Exit )

:Options
echo. & echo  ==========================================================================================
        echo  Enable or Disable NTFS Last Access Time Stamp Updates.
        echo  ==========================================================================================
echo. & echo  IMPORTANT: Restart the Computer AFTER for the changes to be FULLY implemented.
echo. & echo  Options:
echo. & echo  [0] EXIT this Program.
echo. & echo  [1] User Managed             - Last Access Time Updates Enabled.
        echo  [2] User Managed             - Last Access Time Updates Disabled.
        echo  [3] System Managed - Default - Last Access Time Updates Enabled.
        echo  [4] System Managed           - Last Access Time Updates Disabled.
echo. & echo  ==========================================================================================
echo. & echo The Current Status - Last Access Time Updates is . . .
fsutil behavior query disablelastaccess & echo.

CHOICE /N /C 01234 /M ">Enter an Option:"
if %errorlevel%==5 goto :System_Managed_Disabled
if %errorlevel%==4 goto :System_Managed_Enabled_Default
if %errorlevel%==3 goto :User_Managed_Disabled
if %errorlevel%==2 goto :User_Managed_Enabled
if %errorlevel%==1 goto :Exit
goto :Options

:User_Managed_Enabled
echo.
fsutil behavior set disablelastaccess 0
echo. & echo  Processing COMPLETE.
echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit

:User_Managed_Disabled
echo.
fsutil behavior set disablelastaccess 1
echo. & echo  Processing COMPLETE.
echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit

:System_Managed_Enabled_Default
echo.
fsutil behavior set disablelastaccess 2
echo. & echo  Processing COMPLETE.
echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit

:System_Managed_Disabled
echo.
fsutil behavior set disablelastaccess 3
echo. & echo  Processing COMPLETE.
echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit

:Exit