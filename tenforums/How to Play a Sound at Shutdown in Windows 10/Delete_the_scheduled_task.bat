:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: http://www.tenforums.com/tutorials/94891-play-sound-shutdown-windows-10-a.html
:: ************************************************************************************
@echo off & mode con cols=85 lines=5 & color 17
(Net session >nul 2>&1)&&(cd /d "%~dp0")||(PowerShell start """%~0""" -verb RunAs & Exit /B)
:: ************************************************************************************/
Echo.
Schtasks /delete /tn "TenForums\Play shutdown sound" /f
Echo           Please press a key to close this message.
Pause>nul
Exit