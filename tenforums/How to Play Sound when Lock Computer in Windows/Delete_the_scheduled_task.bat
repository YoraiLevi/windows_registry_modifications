:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: https://www.tenforums.com/tutorials/94927-how-play-sound-when-lock-computer-windows.html
:: ************************************************************************************
@echo off & mode con cols=85 lines=5 & color 17
(Net session >nul 2>&1)&&(cd /d "%~dp0")||(PowerShell start """%~0""" -verb RunAs & Exit /B)
:: ************************************************************************************/
Echo.
Schtasks /delete /tn "TenForums\Play lock sound" /f
RmDir "%WinDir%\System32\Tasks\TenForums\">nul 2>&1
Echo.
Echo           Please press a key to close this message.
Pause>nul
Exit