:: Created by: Shawn Brink
:: Created on: August 27th 2018
:: Tutorial: https://www.tenforums.com/tutorials/116749-enable-disable-remote-assistance-connections-windows.html


REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 1 /f

netsh advfirewall firewall set rule group="Remote Assistance" new enable=yes
