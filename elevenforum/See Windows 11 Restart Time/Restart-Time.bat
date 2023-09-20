:: This script was created by Matthew Wai at www.TenForums.com/members/matthew-wai.html
::—————————————————————————————————————————————————————————————————————————————————
@echo off & mode con cols=54 lines=5 & For /F "skip=1 tokens=*" %%# in (
'"PowerShell Get-Date"') DO (Set "ET=%%#")
Title Measure the restart time & color 17 & Set "[U]=($ET-$ST).TotalSeconds"
Set "[N]=Measure_the_restart_time_via_a_batch_script_provided_by_TenForums"
Set "[F]=%ProgramData%" & Set "[C]=[DateTime]::parse" & color 17
Set "[K]=HKCU\SOFTWARE\Microsoft"&Set "[I]= seconds to completely restart Windows."
Set "[S]=%[F]%\%[N]%.log" & Set "[L]=  It took " & Set "[P]=PowerShell.exe -Command "
If exist "%[S]%" (Echo.& Goto [Post_restart]) else (Echo.
Echo     Please firstly close all running applications.
Echo     Then press a key to restart Windows. & Pause>Nul
REG Add "%[K]%\Windows\CurrentVersion\Run" /V "%[N]%" /T REG_SZ /D """"%~f0"""" /F>Nul 
%[P]%Get-Date>"%[S]%" && Shutdown -r -f -t 00 & Exit)
:[Post_restart]
For /f "delims=" %%# in ('"Type "%[S]%""') Do (set "ST=%%#")
%[P]%"&{$ST=%[C]%('%ST%');$ET=%[C]%('%ET%');echo (-join('%[L]%',%[U]%,'%[I]%'));}" 
Del "%[S]%" & REG Delete "%[K]%\Windows\CurrentVersion\Run" /V "%[N]%" /F>Nul
Echo   You may press a key to close this window. & Pause>Nul & Exit
::—————————————————————————————————————————————————————————————————————————————————