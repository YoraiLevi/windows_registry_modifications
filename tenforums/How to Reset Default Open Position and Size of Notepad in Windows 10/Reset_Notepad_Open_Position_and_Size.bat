@echo off

:: Created by: Shawn Brink
:: Created on: April 1st 2016
:: Tutorial: http://www.tenforums.com/tutorials/45897-notepad-reset-default-open-position-size-windows-10-a.html


Reg Delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /V iWindowPosDX /F
Reg Delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /V iWindowPosDY /F
Reg Delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /V iWindowPosX /F
Reg Delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /V iWindowPosY /F


