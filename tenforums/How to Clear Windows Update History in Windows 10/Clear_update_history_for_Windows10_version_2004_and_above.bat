:: Created by: Shawn Brink
:: Created on: May 2, 2020
:: Updated on: May 25, 2020
:: Tutorial: https://www.tenforums.com/tutorials/86709-clear-windows-update-history-windows-10-a.html


@echo off
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop usosvc & net stop wuauserv & del %systemroot%\SoftwareDistribution\DataStore\Logs\edb.log & del /f /q C:\ProgramData\USOPrivate\UpdateStore\* & net start usosvc & net start wuauserv & UsoClient.exe RefreshSettings' -Verb runAs"


