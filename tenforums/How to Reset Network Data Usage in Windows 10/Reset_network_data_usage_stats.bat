:: Created by: Shawn Brink
:: Created on: October 13th 2015
:: Tutoiral: https://www.tenforums.com/tutorials/26225-reset-network-data-usage-windows-10-a.html

powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop DPS > NUL 2>&1 & DEL /F /S /Q /A "%windir%\System32\sru\*" & net start DPS > NUL 2>&1' -Verb runAs"