:: Created by: Shawn Brink
:: Created on: November 26, 2020
:: Tutorial: https://www.tenforums.com/tutorials/45143-reset-action-center-quick-actions-default-windows-10-a.html


REG DELETE "HKCU\Control Panel\Quick Actions" /F

taskkill /f /im explorer.exe

start explorer.exe