:: Created by: Shawn Brink
:: Created on: October 13th 2017
:: Tutorial: https://www.tenforums.com/tutorials/95383-enable-disable-fast-user-switching-windows-10-a.html
 

powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V HideFastUserSwitching /T REG_DWORD /D 00000001 /F & REG Delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /V HideFastUserSwitching /F & taskkill /f /im explorer.exe & start explorer.exe' -Verb runAs"