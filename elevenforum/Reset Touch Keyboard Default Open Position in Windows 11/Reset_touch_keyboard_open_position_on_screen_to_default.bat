@echo off

:: Created by: Shawn Brink
:: Created on: November 19, 2021
:: Tutorial: https://www.elevenforum.com/t/reset-touch-keyboard-default-open-position-in-windows-11.2887/


REG Delete "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /V OptimizedKeyboardRelativeXPositionOnScreen /F

REG Delete "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /V OptimizedKeyboardRelativeYPositionOnScreen /F

taskkill /f /im explorer.exe
start explorer.exe