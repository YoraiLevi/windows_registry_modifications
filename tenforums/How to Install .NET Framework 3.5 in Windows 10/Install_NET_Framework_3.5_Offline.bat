@echo off
:: ##############################################################################
:: # Title:      Install .NET Framework v3.5 Offline using Installation Media   #
:: # Created By: Paul Black at TenForums.com/members/paul-black.html            #
:: # Created:    September 2020                                                 #
:: ##############################################################################
title Install .NET Framework v3.5 - Written by Paul Black.
mode con: cols=80 lines=25 & color 17
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERROR: This Batch file MUST be run in an ELEVATED cmd prompt [ Administrator ] & echo. & echo         Right-click the Batch file and click ^<Run as administrator^>. & echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit )
for %%I in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist "%%I:\\sources\install.wim" set setupdrv=%%I
if defined setupdrv (
  echo. & echo Installation media found on drive %setupdrv%:
  echo. & echo Installing .NET Framework v3.5 [ includes .NET v2.0 and .NET v3.0 ] . . .
               Dism /Online /Enable-Feature /FeatureName:NetFX3 /All /Source:%setupdrv%:\sources\sxs /LimitAccess
  echo. & echo .NET Framework v3.5 should now be installed. & echo.
) else (
  echo. & echo ERROR: No installation media found^!
  echo. & echo You MUST either . . .
  echo. & echo    [1] Insert a DVD or USB of the exact same build and run this file again.
          echo    [2] Mount an ISO of the exact same build and run this file again. & echo.
)
echo Press ANY key to EXIT . . . & pause >nul & goto :Exit
:Exit