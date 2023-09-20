:: Created by: Shawn Brink
:: Created on: June 13, 2017
:: Tutorial: https://www.tenforums.com/tutorials/86709-clear-windows-update-history-windows-10-a.html


@echo off
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop wuauserv & del %systemroot%\SoftwareDistribution\DataStore\Logs\edb.log & net start wuauserv' -Verb runAs"


