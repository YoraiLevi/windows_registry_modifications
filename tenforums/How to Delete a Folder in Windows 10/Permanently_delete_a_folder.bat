:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: https://www.tenforums.com/tutorials/124750-delete-folder-windows-10-a.html
:: ************************************************************************************
@echo off & mode con cols=20 lines=3 & color 17
(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)
::===================================================================================
Echo.&Echo   Select a folder. 
Call :@ "Please select the folder you want to delete permanently." SourceFolder
:@
Set "@="(new-object -COM 'Shell.Application').BrowseForFolder(0,'%1',0x200,0).self.path""
For /f "usebackq delims=" %%# in (`PowerShell %@%`) do set "Folder_to_be_deleted=%%#"

If "%Folder_to_be_deleted%"=="" (Exit) 
Cls & Title Permanently delete a folder. & mode con cols=70 lines=8 & Echo.
Echo    Are you sure you want to delete the following folder permanently?
Echo.&Echo    "%Folder_to_be_deleted%" & Echo.
echo    Press (D) to delete the above folder permanently. 
echo    Press (C) to cancel the operation.

CHOICE /C "DC" /M "Your choice?:" >nul 2>&1  
If %errorlevel%==2 (Exit)
::================================================================
For /f "tokens=2 delims==" %%# in ('WMIC OS Get localdatetime /value') Do (Set "T=%%#")
Set "Y=%T:~0,4%" & Set "M=%T:~4,2%" & Set "D=%T:~6,2%"
Set "H=%T:~8,2%" & Set "#=%T:~10,2%" & Set "S=%T:~12,2%"
Set "T=%Y%-%M%-%D%_at_%H%-%#%-%S%"
MD %Temp%\Empty_folder_%T%

(RoboCopy "%Temp%\Empty_folder_%T%" "%Folder_to_be_deleted%" /MIR > Nul)&&(RD "%Folder_to_be_deleted%")||(RD "%Folder_to_be_deleted%")
RD "%Temp%\Empty_folder_%T%" & mode con cols=41 lines=4
If not exist "%Folder_to_be_deleted%" (Echo.&Echo    The folder has been deleted.
Echo    Press a key to close this window.&pause>nul & Exit)
Echo.&Echo    The operation has failed.
Echo    Press a key to close this window.&pause>nul & Exit