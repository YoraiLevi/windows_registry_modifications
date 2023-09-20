:: Created by: Shawn Brink
:: Created on: June 10th 2018
:: Tutorial: https://www.tenforums.com/tutorials/111949-reset-autoplay-settings-default-windows-10-a.html


REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection /F

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers /F