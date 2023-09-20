:: Created by: Shawn Brink
:: Created on: June 26th 2016
:: Tutorial: http://www.tenforums.com/tutorials/54452-font-cache-rebuild-windows-10-a.html


@echo off

:: Stop and disable "Windows Font Cache Service" service
:FontCache
sc stop "FontCache"
sc config "FontCache" start=disabled
sc query FontCache | findstr /I /C:"STOPPED" 
if not %errorlevel%==0 (goto FontCache)


:: Grant access rights to current user for "%WinDir%\ServiceProfiles\LocalService" folder and contents
icacls "%WinDir%\ServiceProfiles\LocalService" /grant "%UserName%":F /C /T /Q


:: Delete font cache
del /A /F /Q "%WinDir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*FontCache*"

del /A /F /Q "%WinDir%\System32\FNTCACHE.DAT"


:: Enable and start "Windows Font Cache Service" service
sc config "FontCache" start=auto
sc start "FontCache"




