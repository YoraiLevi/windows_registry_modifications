:: Created by: Shawn Brink
:: Created on: November 22, 2021
:: Tutorial: https://www.elevenforum.com/t/reset-and-rebuild-search-index-in-windows-11.2945/


@echo off
sc config wsearch start= disabled
net stop wsearch
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb"
:wsearch
sc config wsearch start= delayed-auto
net start wsearch
IF NOT %ERRORLEVEL%==0 (goto :wsearch) ELSE goto :END
:END
