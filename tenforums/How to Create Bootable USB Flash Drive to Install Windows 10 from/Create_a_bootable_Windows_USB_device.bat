:: This script was created by Matthew Wai at TenForums.com/members/matthew-wai.html
:: www.TenForums.com/tutorials/2376-create-bootable-usb-flash-drive-install-windows-10-a.html
::===================================================================================
@echo off & Title Please select an ISO file & mode con cols=53 lines=4 & color 17
(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)
echo.
echo    Please select a Windows ISO file to be mounted.
Echo.
Set P=PowerShell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$O = New-Object System.Windows.Forms.OpenFileDialog; $O.ShowDialog()|out-null; $O.FileName}"
For /f "delims=" %%# in ('%P%') Do (Set "ISO=%%#")
If "%ISO%"=="" (Exit) else (Cls&Echo.&echo    The script is checking the ISO file.)
For /f "Skip=3 usebackq tokens=1" %%# in (`"PowerShell Mount-DiskImage """"%ISO%"""" -PassThru ^| Get-Volume"`) Do (Set "X=%%#" & Set "EFI=%%#:\EFI\BOOT\BOOT*.efi")
If exist "%EFI%" (Echo EFI exists ) else (mode con cols=60 lines=10 & color 17
Echo.&Echo    The script could not find the boot loader "boot*.efi".
Echo    Please check whether the following problems exist:&Echo.
Echo    ^(1^) The ISO file cannot be mounted.
Echo    ^(2^) It is not a bootable Windows ISO file.
Echo    ^(3^) The file path contains a special character.&Echo.
Echo        Press a key to close this message. & pause>Nul & exit)
Set "File=%X%:\sources\install.esd"
If not exist "%File%" (Set "File=%X%:\sources\install.wim")
For /f "usebackq tokens=1" %%# in (`"PowerShell ((Get-Item %File%).length/1MB)"`) Do (Set "Size=%%#")
If %Size% GTR 4095.999998092651 (Set "FS=exFAT") else (Set "FS=FAT32")
::============================================================================
Title  Retrieving the friendly names of the devices. & mode con cols=70 lines=100 & color 17
Echo.&Echo    The script is searching for the storage devices on this computer.
Echo    Please wait for a while. & Echo.
Set "T=%Temp%\[T].txt" & Set "D=%Temp%\[D].txt" & Set "INP=%Temp%\[D].inp"
If exist "%T%" DEL /F /Q "%T%"
If exist "%D%" DEL /F /Q "%D%"
If exist "%INP%" DEL /F /Q "%INP%"
(Echo List Disk)>"%INP%" && DiskPart /S "%INP%">"%T%" && echo [.]>>"%T%"
For /F "skip=5 tokens=1,2" %%A in ('Echo List Disk^|DiskPart') DO (
If "%%A"=="Disk" If not "%%B"=="###" (Call:Get_details "%%B"))
Goto Display_the_device_list
:Get_details
Echo    Retrieving the friendly name of Disk %~1 & Set "Number=%~1"
(Echo Sel Disk %~1 & Echo Det Disk)>"%INP%"
DiskPart /S "%INP%">"%D%"
For /F "skip=5 tokens=*" %%A in ('"More "%D%""') Do (Call:Get_names "%%A")
Goto:EOF
:Get_names 
Set "Text=%~1"
If "%Text%"=="" Goto:EOF
If "%[OK]%"=="Yes" (Echo Disk %Number%  is  "%Text%".>>"%T%" && Goto Finished)
If not "%Text%"=="%Text:is now the selected disk=X%" (Set "[OK]=Yes")
Goto:EOF
:Finished
Set "[OK]=No" & Goto:EOF
:Display_the_device_list
Title  Please select a USB device. & mode con cols=81 & color 17
Echo. & For /F "Skip=5 tokens=*" %%A in ('"More "%T%""') DO (
If "%%A"=="[.]" (Echo.) else (Echo    %%A))
Echo.
Echo     Caution: the following operation will erase all data from your USB Device.
:Enter_a_number
Setlocal & echo.
SET /P "(#)= --> Please key in the Disk number (shown in the "###" column) of your USB Device     and then press [Enter]: "
Set "@=" & For /f "delims=0123456789" %%# in ("%(#)%") Do (Set @=%%#)
If defined @ (Echo.&echo     Please enter only a number without anything else, e.g. letters and spaces. & Goto Enter_a_number)
::============================================================================
(Echo Sel Disk %(#)% & Echo Clean & Echo Convert MBR & Echo Create par primary 
 Echo Format FS=%FS% quick & Echo Active & Echo Assign & Echo Exit)|DiskPart	
(Echo Sel Disk %(#)% & Echo Det Disk)>"%INP%" && DiskPart /S "%INP%">"%D%"
For /F "skip=9 tokens=1,2,3" %%A in ('"More "%D%""') Do (
If "%%A"=="Volume" If not "%%C"=="Ltr" (Set "Letter=%%C" & Goto Copying))
:Copying
Set "CMD=%Temp%\CMD.cmd" & Set "#=Echo Echo" 
(Echo @echo off^&Title Copying items onto the USB device.^&mode con cols=62 lines=10^&color 17 
%#%.^&Echo    The USB device has been formatted as %FS%.
%#%    Copying everything from the ISO file onto the USB device.
%#%    It may take quite a while, depending on the USB transfer
%#%    speed. Please be patient.
Echo PowerShell Copy-Item -Path '%X%:\*' -Destination '%Letter%:\' -Recurse
Echo PowerShell Dismount-DiskImage """%ISO%""" ^> Nul
%#%.^&Echo    Operations completed.
%#%    The bootable Windows 10 USB device is now ready to use.
%#%    You may press a key to close this window.
Echo Pause^>Nul ^& Exit)> "%CMD%" & Start "" "%CMD%"

Echo.&Echo         The USB device has been formatted as %FS%.
Echo         You may press a key to close this window.
Pause>Nul & Exit
