:: Created by: Shawn Brink
:: Created on: July 12th 2017
:: Tutorial: https://www.tenforums.com/tutorials/88749-enable-disable-search-history-windows-10-file-explorer.html


REG DELETE HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer /V DisableSearchBoxSuggestions /F 

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer /V DisableSearchBoxSuggestions /F 

taskkill /F /IM explorer.exe 
explorer.exe


