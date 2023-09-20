:: Created by: Shawn Brink
:: Created on: December 25, 2021
:: Tutorial: https://www.elevenforum.com/t/enable-or-disable-mobile-hotspot-power-saving-in-windows-11.3574/


powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop "icssvc" & REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\icssvc\Settings" /V PeerlessTimeoutEnabled /T REG_DWORD /D 1 /F & net start "icssvc"' -Verb runAs"






