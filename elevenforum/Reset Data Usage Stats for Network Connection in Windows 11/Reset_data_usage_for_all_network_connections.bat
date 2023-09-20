:: Created by: Shawn Brink
:: Created on: October 26, 2021
:: Tutoiral: https://www.elevenforum.com/t/reset-data-usage-stats-for-network-connection-in-windows-11.2270/

powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop DPS > NUL 2>&1 & DEL /F /S /Q /A "%windir%\System32\sru\*" & net start DPS > NUL 2>&1' -Verb runAs"