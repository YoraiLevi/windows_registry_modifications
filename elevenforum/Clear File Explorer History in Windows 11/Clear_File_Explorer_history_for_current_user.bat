:: Created by: Shawn Brink
:: Created on: August 22, 2022
:: Tutorial: https://www.elevenforum.com/t/clear-file-explorer-history-in-windows-11.8468/


:: Clear history in File Explorer Home
Del /F /Q %APPDATA%\Microsoft\Windows\Recent\*

Del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*

Del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*


:: Clear typed history in Run dialog
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU
if not ErrorLevel 1 reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /F

:: Clear typed history in File Explorer address bar
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths
if not ErrorLevel 1 reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /F



