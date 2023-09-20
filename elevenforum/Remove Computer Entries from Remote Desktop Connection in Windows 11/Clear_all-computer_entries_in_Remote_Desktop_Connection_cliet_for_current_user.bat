:: Created by: Shawn Brink
:: Created on: February 26, 2022
:: Tutorial: https://www.elevenforum.com/t/remove-computer-entries-from-remote-desktop-connection-in-windows-11.4890/


:: Clear entries from RDC Cumputer box
REG DELETE "HKCU\Software\Microsoft\Terminal Server Client" /F

:: Delete last connection history to not show in RDC Computer box
DEL /F /S /Q /A "%UserProfile%\Documents\Default.rdp"

:: Clear RDC jump list
DEL /F /S /Q /A "%AppData%\Microsoft\Windows\Recent\AutomaticDestinations\1bc392b8e104a00e.automaticDestinations-ms"