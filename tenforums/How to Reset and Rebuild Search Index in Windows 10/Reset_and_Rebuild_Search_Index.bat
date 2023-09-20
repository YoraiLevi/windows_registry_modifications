:: Created by: Shawn Brink
:: Created on: August 1st 2016
:: Tutorial: https://www.tenforums.com/tutorials/58569-rebuild-search-index-windows-10-a.html


@echo off
net stop wsearch
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb"
:wsearch
net start wsearch
IF NOT %ERRORLEVEL%==0 (goto :wsearch) ELSE goto :END
:END
