:: Created by: Shawn Brink
:: Created on: August 4, 2022
:: Tutorial: https://www.elevenforum.com/t/enable-or-disable-remote-assistance-connections-in-windows-11.8117/


REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 1 /f

REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowFullControl /t REG_DWORD /d 1 /f

netsh advfirewall firewall set rule group="Remote Assistance" new enable=yes