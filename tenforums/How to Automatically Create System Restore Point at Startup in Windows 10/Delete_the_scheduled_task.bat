:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: http://www.tenforums.com/tutorials/64791-automatically-create-system-restore-point-startup-windows-10-a.html
:: ************************************************************************************
@echo off & mode con cols=98 lines=5 & color 17
(Net session >nul 2>&1)&&(cd /d "%~dp0")||(PowerShell start """%~0""" -verb RunAs & Exit /B)
:: ************************************************************************************/
Echo.
Schtasks /delete /tn "TenForums\Create Restore Point at Startup" /f
Echo.
Echo           Please press a key to close this message.
Pause>nul
Exit