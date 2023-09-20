@echo off
:: #########################################################################################################
:: # Title     : Delete Windows.old, $WINDOWS.~BT, or $WINDOWS.~WS Folders                                 #
:: # Created By: Paul Black at TenForums.com/members/paul-black.html                                       #
:: # Created In: December 2020                                                                             #
:: # Tutorial  : https://www.tenforums.com/tutorials/2066-delete-windows-old-folder-windows-10-a.html      #
:: #########################################################################################################
title Delete System Folders - Written by Paul Black.
mode con: cols=80 lines=26 & color 17
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs") && fsutil dirty query %systemdrive% 1>nul 2>nul || ( echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && Exit /b)
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERROR: This Batch file MUST be run in an ELEVATED cmd prompt [ Administrator ] & echo. & echo         Right-click the Batch file and click ^<Run as administrator^>. & echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & goto :Exit )

set "Win_Old=%SystemDrive%\Windows.old"
set "Win_BT=%SystemDrive%\$WINDOWS.~BT"
set "Win_WS=%SystemDrive%\$WINDOWS.~WS"

:Options

echo. & echo  ==============================================================================
        echo  Delete Windows.old, $WINDOWS.~BT, or $WINDOWS.~WS Folders [ Windows 10 ONLY ].
        echo  ==============================================================================
echo. & echo  Options:
echo. & echo  [0] EXIT this Program.
echo. & echo  [1] Delete the Windows.old  Folder.
        echo  [2] Delete the $WINDOWS.~BT Folder.
        echo  [3] Delete the $WINDOWS.~WS Folder.
echo. & echo  ==============================================================================
echo.

CHOICE /N /C 0123 /M ">Enter an Option:"
if %errorlevel%==4 goto Win_WS
if %errorlevel%==3 goto Win_BT
if %errorlevel%==2 goto Win_Old
if %errorlevel%==1 goto Exit
goto :Options

:Win_Old

if not exist "%SystemDrive%\Windows.old" (
  echo. & echo  The folder does NOT exist.
  echo. & echo ^>Press ANY key to return to the Options . . . & pause >nul
  cls & goto :Options
) else (
  echo. & echo  Processing . . .
  takeown /F "C:\Windows.old" /A /R /D Y
  icacls "C:\Windows.old" /grant *S-1-5-32-544:F /T /C /Q
  rmdir /S /Q "C:\Windows.old" >nul 2>&1
  echo. & echo  Processing COMPLETE.
  echo. & echo ^>Press ANY key to return to the Options . . . & pause >nul
  cls & goto :Options
)

:Win_BT

if not exist "%SystemDrive%\$WINDOWS.~BT" (
  echo. & echo  The folder does NOT exist.
  echo. & echo ^>Press ANY key to return to the Options . . . & pause >nul
  cls & goto :Options
) else (
  echo. & echo  Processing . . .
  takeown /F C:\$Windows.~BT\* /A /R /D Y
  icacls C:\$Windows.~BT\*.* /T /grant administrators:F 
  rmdir /S /Q C:\$Windows.~BT\ >nul 2>&1
  echo. & echo  Processing COMPLETE.
  echo. & echo ^>Press ANY key to return to the Options . . . & pause >nul
  cls & goto :Options
)

:Win_WS

if not exist "%SystemDrive%\$WINDOWS.~WS" (
  echo. & echo  The folder does NOT exist.
  echo. & echo ^>Press ANY key to return to the Options . . . & pause >nul
  cls & goto :Options
) else (
  echo. & echo  Processing . . .
  takeown /F C:\$Windows.~WS\* /A /R /D Y
  icacls C:\$Windows.~WS\*.* /T /grant administrators:F 
  rmdir /S /Q C:\$Windows.~WS\ >nul 2>&1
  echo. & echo  Processing COMPLETE.
  echo. & echo ^>Press ANY key to return to the Options . . . & pause >nul
  cls & goto :Options
)
:Exit