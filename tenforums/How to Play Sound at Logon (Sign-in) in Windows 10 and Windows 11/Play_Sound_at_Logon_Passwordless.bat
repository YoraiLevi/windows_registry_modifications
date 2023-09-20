:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: The idea came from Paul Black at TenForums.com/members/paul-black.html
:: https://www.tenforums.com/tutorials/94884-how-play-sound-logon-sign-windows-10-a.html
::——————————————————————————————————————————————————————————————————————————————————————————
@echo off & Title Play a sound at Logon (Sign-in) & mode con cols=90 lines=15 & color 17
(Fsutil Dirty Query %SystemDrive%>Nul)||(PowerShell start """%~f0""" -verb RunAs & Exit /B)
::——————————————————————————————————————————————————————————————————————————————————————————
@ECHO OFF & echo. & Set "[V]=VBScript file" & Set "[S]=Windows\Start Menu\Programs\Startup"
echo       Please key in an option number and press [Enter]: & echo.
echo   1 = Create a %[V]% for playing a sound at logon (sign-in) for the current user.
echo   2 = Create a %[V]% for playing a sound at logon (sign-in) for all users.
echo   3 = Delete the %[V]% previously created by this script for the current user.
echo   4 = Delete the %[V]% previously created by this script for all users.

Set "[M]=    Please do not leave a space before or after the file path."
Set "[VBS]=Play_Sound_at_Logon_(Sign-in).vbs" & Set "[F]=the Startup folder"

CHOICE /C "1234" /M "Your choice?:" >nul 2>&1  
If %errorlevel%==1  (goto Option_1) 
If %errorlevel%==2  (goto Option_2) 
If %errorlevel%==3  (goto Option_3) 
If %errorlevel%==4  (goto Option_4) 
::——————————————————————————————————————————————————————————————————————————————————————————
:Option_1
Set "[Folder]=%UserProfile%\AppData\Roaming\Microsoft\%[S]%" & Setlocal & echo.
:Enter_the_path
SET /P "[Path]= --> Please key in (or copy and paste) the full path (without quotation marks) of the .wav     sound file you want to be played (for example C:\Windows\Media\Windows Logon.wav)         and then press [Enter]: " 
Set "+=""%[Path]%""" 
Set "(+)=%+: ""=""%" 
Set "[+]=%+:"" =""%"		
If not "%+%"=="%(+)%" (Echo. & Echo %[M]% & Echo. & Goto Enter_the_path)
If not "%+%"=="%[+]%" (Echo. & Echo %[M]% & Echo. & Goto Enter_the_path)
If exist "%[Folder]%\%[VBS]%" (DEL /F /Q "%[Folder]%\%[VBS]%")
Echo CreateObject("wscript.shell").Run"PowerShell.exe -Command (New-Object Media.SoundPlayer '%[Path]%').PlaySync()",0 > "%[Folder]%\%[VBS]%" 
echo. & echo       %[VBS]%
echo       The above file has been created in %[F]% for the current user.
echo       You may press a key to close this window. & pause > nul & Exit
::——————————————————————————————————————————————————————————————————————————————————————————
:Option_2
Set "[Folder]=%ProgramData%\Microsoft\%[S]%" & Setlocal & echo.
:Enter_the_path
SET /P "[Path]= --> Please key in (or copy and paste) the full path (without quotation marks) of the .wav     sound file you want to be played (for example C:\Windows\Media\Windows Logon.wav)         and then press [Enter]: " 
Set "+=""%[Path]%""" 
Set "(+)=%+: ""=""%" 
Set "[+]=%+:"" =""%"		
If not "%+%"=="%(+)%" (Echo. & Echo %[M]% & Echo. & Goto Enter_the_path)
If not "%+%"=="%[+]%" (Echo. & Echo %[M]% & Echo. & Goto Enter_the_path)
If exist "%[Folder]%\%[VBS]%" (DEL /F /Q "%[Folder]%\%[VBS]%")
Echo CreateObject("wscript.shell").Run"PowerShell.exe -Command (New-Object Media.SoundPlayer '%[Path]%').PlaySync()",0 > "%[Folder]%\%[VBS]%" 
echo. & echo       %[VBS]%
echo       The above file has been created in %[F]% for all users.
echo       You may press a key to close this window. & pause > nul & Exit
::——————————————————————————————————————————————————————————————————————————————————————————
:Option_3
Title Delete the %[V]% previously created. & mode con cols=70 lines=6
Set "[Folder]=%UserProfile%\AppData\Roaming\Microsoft\%[S]%" & Echo.
Echo. & If exist "%[Folder]%\%[VBS]%" (
DEL /F /Q "%[Folder]%\%[VBS]%" && Echo         The %[V]% has been deleted from %[F]%.) else (
Echo         The %[V]% does not exist.)
Echo         Please press a key to close this message. & pause > nul & Exit
::——————————————————————————————————————————————————————————————————————————————————————————
:Option_4
Title Delete the %[V]% previously created. & mode con cols=70 lines=6
Set "[Folder]=%ProgramData%\Microsoft\%[S]%" & Echo.
Echo. & If exist "%[Folder]%\%[VBS]%" (
DEL /F /Q "%[Folder]%\%[VBS]%" && Echo         The %[V]% has been deleted from %[F]%.) else (
Echo         The %[V]% does not exist.)
Echo         Please press a key to close this message. & pause > nul & Exit
::——————————————————————————————————————————————————————————————————————————————————————————