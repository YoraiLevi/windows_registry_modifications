:: Created by: Shawn Brink
:: Created on: March 6th 2019
:: Tutorial: https://www.tenforums.com/tutorials/128409-enable-disable-automatically-turn-off-mobile-hotspot-windows-10-a.html


powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop "icssvc" & REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\icssvc\Settings" /V PeerlessTimeoutEnabled /T REG_DWORD /D 0 /F & net start "icssvc"' -Verb runAs"






