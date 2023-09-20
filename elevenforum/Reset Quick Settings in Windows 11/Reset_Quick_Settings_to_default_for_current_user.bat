:: Created by: Shawn Brink
:: Created on: November 1, 2021
:: Tutorial: https://www.elevenforum.com/t/reset-quick-settings-in-windows-11.2424/


REG DELETE "HKCU\Control Panel\Quick Actions" /F

taskkill /f /im explorer.exe

start explorer.exe