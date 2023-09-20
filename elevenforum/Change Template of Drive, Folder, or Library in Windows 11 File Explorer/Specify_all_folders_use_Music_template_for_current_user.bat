@echo off

:: Created by: Shawn Brink
:: Created on: September 9, 2021
:: Updated on: August 31. 2022
:: Tutorial: https://www.elevenforum.com/t/change-template-of-drive-folder-or-library-in-windows-11-file-explorer.1259/


:: Resets folder view settings, window size and position of all folders
Reg Delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /F
Reg Delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /F

:: To reset "Apply to Folders" views to default for all folder types
REG Delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /F

:: Specify Music template to all folders
REG ADD "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /V FolderType /T REG_SZ /D Music /F


:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe