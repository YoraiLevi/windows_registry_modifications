@echo off

:: Created by: Shawn Brink
:: Created on: June 17, 2021
:: Tutorial: https://www.elevenforum.com/t/restore-classic-start-menu-in-windows-11.30/


REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Start_ShowClassicMode /F

taskkill /f /im explorer.exe
start explorer.exe