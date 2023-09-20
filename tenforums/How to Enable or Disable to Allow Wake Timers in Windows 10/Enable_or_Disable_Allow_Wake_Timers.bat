@echo off
:: ##############################################################################
:: # Title:      Enable Or Disable Allow Wake Timers                            #
:: # Created By: Paul Black at TenForums.com/members/paul-black.html            #
:: # Created:    18-Oct-2020                                                    #
:: ##############################################################################
title Enable Or Disable Allow Wake Timers - Written by Paul Black.
mode con: cols=80 lines=25 & color 17
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERROR: This Batch file MUST be run in an ELEVATED cmd prompt [ Administrator ] & echo. & echo         Right-click the Batch file and click ^<Run as administrator^>. & echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit )

:Options
echo. & echo  ==============================================================================
        echo  Enable Or Disable Allow Wake Timers.
        echo  ==============================================================================
echo. & echo  Options:
echo. & echo  [0] EXIT this Program.
echo. & echo  [1] On Battery - Enable  Allow Wake Timers.
        echo  [2] On Battery - Disable Allow Wake Timers.
        echo  [3] On Battery - Enable  Allow Important Wake Timers Only.
echo. & echo  [4] Plugged In - Enable  Allow Wake Timers.
        echo  [5] Plugged In - Disable Allow Wake Timers.
        echo  [6] Plugged In - Enable  Allow Important Wake Timers Only.
echo. & echo  ==============================================================================
echo.

CHOICE /N /C 0123456 /M ">Enter an Option:"
if %errorlevel%==7 goto Desk_Imp
if %errorlevel%==6 goto Desk_Dis
if %errorlevel%==5 goto Desk_Ena
if %errorlevel%==4 goto Batt_Imp
if %errorlevel%==3 goto Batt_Dis
if %errorlevel%==2 goto Batt_Ena
if %errorlevel%==1 goto Exit
goto :Options

:Batt_Ena
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1

:Batt_Dis
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0

:Batt_Imp
powercfg /SETDCVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 2

:Desk_Ena
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1

:Desk_Dis
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0

:Desk_Imp
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 2

echo. & echo  Processing COMPLETE.
echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit
:Exit