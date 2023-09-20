@echo off

:: Created by: Shawn Brink
:: Created on: October 27, 2021
:: Tutorial: https://www.elevenforum.com/t/add-or-remove-shortcut-name-extension-in-windows-11.2291/


REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V link /T REG_Binary /D 00000000 /F

Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /V ShortcutNameTemplate /F


:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe