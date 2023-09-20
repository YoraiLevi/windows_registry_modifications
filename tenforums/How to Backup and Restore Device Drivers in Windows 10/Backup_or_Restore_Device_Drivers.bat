:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: http://www.tenforums.com/tutorials/68426-backup-restore-device-drivers-windows-10-a.html
:: ************************************************************************************/
@echo off & Title Backup or Restore Device Drivers & mode con cols=93 & color 17
(Net session >nul 2>&1)&&(cd /d "%~dp0")||(PowerShell start """%~0""" -verb RunAs & Exit /B)
:: ************************************************************************************/
echo. 
echo    Press (1) to back up all 3rd-party device drivers into a folder.
echo    Press (2) to restore all 3rd-party device drivers from a folder.
echo    Press (3) to restore a device driver backup via Device Manager.
:Choice
CHOICE /C "123" /M "Your choice?:" >nul 2>&1  
If %errorlevel%==1  (goto Option_1) & Exit
If %errorlevel%==2  (goto Option_2) & Exit
If %errorlevel%==3  (goto Option_3) & Exit
Exit
:Option_1
Call:✶ "Please select a folder or click on [ Make New Folder ] at the bottom. It is advisable to select a folder on an external device." SourceFolder
:✶
Set "✱="(new-object -COM 'Shell.Application').BrowseForFolder(0,'%1',0,0).self.path""
For /f "usebackq delims=" %%# in (`PowerShell %✱%`) do set "【Folder】=%%#"
If "%【Folder】%"=="" (Goto Choice & Exit) 
dism /online /export-driver /destination:"%【Folder】%"
Echo.&Echo    The device drivers have been exported into the following folder:
Echo    "%【Folder】%" & Echo.&Echo    Press a key to exit.
pause >nul & Exit
Exit
:Option_2
Call:✶ "Please select the folder containing the device drivers previously exported." SourceFolder
:✶
Set "✱="(new-object -COM 'Shell.Application').BrowseForFolder(0,'%1',0x200,0).self.path""
For /f "usebackq delims=" %%# in (`PowerShell %✱%`) do set "【Folder】=%%#"
If "%【Folder】%"=="" (Goto Choice & Exit) 
Echo.
Echo    If necessary, the computer will be automatically restarted to complete the operation of
Echo    importing the drivers. Please save and close anything open and then press a key to start
Echo    the operation.
Echo.
pause >nul
pnputil /add-driver "%【Folder】%\*.inf" /subdirs /install /reboot
echo. & Echo    The process has completed successfully.
Echo    If the computer does not automatically reboot, you may press a key to exit.
pause >nul & Exit
Exit
:Option_3
Start "" "devmgmt.msc" & Exit