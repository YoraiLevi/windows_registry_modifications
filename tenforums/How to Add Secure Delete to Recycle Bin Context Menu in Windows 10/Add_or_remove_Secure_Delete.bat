:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: http://www.tenforums.com/tutorials/124353-add-secure-delete-recycle-bin-context-menu-windows-10-a.html
:: ************************************************************************************
@echo off & Title Add [Secure Delete] into the "Recycle Bin" context menu on Windows 10. 
mode con cols=84 lines=10 & color 17
(Net session >nul 2>&1)&&(cd /d "%~dp0")||(PowerShell start """%~0""" -verb RunAs & Exit /B)
::===================================================================================
Set "(Registry)=HKCR\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\shell\SecureDelete"
Set "【Path】=%ProgramData%\TenForums.com"
Set "【Folder】=%【Path】%\Secure_Delete"
Set "【App】=%WinDir%\System32\sdelete.exe"
Set "✱=Secure Delete"
Set "●=Secure_Delete_Recycle.Bin_from_drive"
Set "✶=Confirmation needed to erase items from Recycle Bin on drive"

CLS & echo. & echo.
echo     Press (1) or (2) to add [%✱%] into the "Recycle Bin" context menu.
echo.  
echo     Option (1) will securely erase all items from Recycle Bin on drive C only.
echo     Option (2) will securely erase all items from Recycle Bin on drives C and D.
echo.  
echo     Press (3) to remove [%✱%] from the "Recycle Bin" context menu.

CHOICE /C "123" /M "Your choice?:" >nul 2>&1  
If %errorlevel%==1  (goto Option_1) & Exit
If %errorlevel%==2  (goto Option_2) & Exit
If %errorlevel%==3  (goto Option_3) & Exit
Exit
:Option_1
Set "Option=1"
If not exist "%【App】%" (Goto Download_&_extract)
Set "(Item)=%✱%"
Set "(Title)=%✶% C"
Set "(CMD)=%【Folder】%\%●%_C_only.cmd"
If not exist "%【Path】%" (mkdir "%【Path】%")
If not exist "%【Folder】%" (mkdir "%【Folder】%")
(
echo @echo off
echo sdelete -p 3 -s "C:\$Recycle.Bin\*" ^&^& taskkill /f /im explorer.exe ^& start explorer.exe
)> "%(CMD)%"
Goto Operations & EXIT

:Option_2
Set "Option=2"
If not exist "%【App】%" (Goto Download_&_extract)
Set "(Item)=%✱% C and D"
Set "(Title)=%✶%s C and D"
Set "(CMD)=%【Folder】%\%●%s_C_and_D.cmd"
If not exist "%【Path】%" (mkdir "%【Path】%")
If not exist "%【Folder】%" (mkdir "%【Folder】%")
(
echo @echo off
echo sdelete -p 3 -s "C:\$Recycle.Bin\*" ^& sdelete -p 3 -s "D:\$Recycle.Bin\*" ^&^& taskkill /f /im explorer.exe ^& start explorer.exe
)> "%(CMD)%"
Goto Operations & EXIT

:Option_3
Reg delete "%(Registry)%" /f
RmDir /s /q "%【Folder】%" 
RmDir "%【Path】%"
Del "%【App】%"
Cls&Echo.&Echo.&Echo.&Echo        Operations completed. Please press a key to exit.&Pause>nul
Exit 
:Operations
Set "(VBS)=%【Folder】%\Confirmation.vbs"
(
echo [#]=MsgBox ^(_
echo "  Are you sure you want to securely erase them?" ^& vbNewLine ^&_
echo "  Select [ Yes ] to securely erase them." ^& vbNewLine ^&_
echo "  Select [ No ] to quit.", vbYesNo + vbQuestion, " %(Title)%"^)
echo If [#]=6 then CreateObject^("wscript.shell"^).run^("""%(CMD)%"""^)
echo WScript.Quit)> "%(VBS)%"

(REG ADD "%(Registry)%" /T REG_SZ /D "%(Item)%" /F)
(REG ADD "%(Registry)%" /V "NoWorkingDirectory" /F)
(REG ADD "%(Registry)%" /V "Position" /T REG_SZ /D "top" /F)
(REG ADD "%(Registry)%" /V "Icon" /T REG_SZ /D "imageres.dll,-5305" /F)
(REG ADD "%(Registry)%\Command" /VE /D "wscript.exe """%(VBS)%"""" /F)
Cls&Echo.&Echo.&Echo.&Echo        Operations completed. Please press a key to exit.&Pause>nul
Exit

:Download_&_extract
If "%Option%"=="1" (Set "Okay=Option_1") else (Set "Okay=Option_2")
echo. & echo.
echo        Downloading the file "SDelete.zip" from http://download.sysinternals.com/...
echo.
PowerShell (New-Object System.Net.WebClient).DownloadFile(\"http://download.sysinternals.com/files/SDelete.zip\",\"$env:temp\\SDelete.zip\")
If %errorlevel%==1 (Goto Message)
PowerShell Expand-Archive -Force \"$env:temp\\SDelete.zip\" \"$env:temp\\SDelete\"
move "%temp%\SDelete\sdelete.exe" "%【App】%" && RmDir /s /q "%temp%\SDelete"
Del "%temp%\SDelete.zip"
:Message
If exist "%【App】%" (Goto %Okay%) else (Cls
echo. & echo.
Echo        The script has failed to download a necessary file.
Echo        Please manually download the following ZIP file:
Echo        http://download.sysinternals.com/files/SDelete.zip
Echo        Extract this file "sdelete.exe" into this folder "%WinDir%\System32".
Echo        Then run this script again. Press any key to exit. & pause >Nul & exit
)
Exit