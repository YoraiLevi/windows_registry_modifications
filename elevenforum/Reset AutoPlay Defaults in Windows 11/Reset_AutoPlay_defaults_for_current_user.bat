:: Created by: Shawn Brink
:: Created on: December 3, 2021
:: Tutorial: https://www.elevenforum.com/t/reset-autoplay-defaults-in-windows-11.3172/


REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection /F

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers /F