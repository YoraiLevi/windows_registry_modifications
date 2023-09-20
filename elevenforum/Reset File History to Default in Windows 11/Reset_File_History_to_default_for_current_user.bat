:: Created by: Shawn Brink
:: Created on: June 11, 2023
:: Tutorial: https://www.elevenforum.com/t/reset-file-history-to-default-in-windows-11.15539/


if exist "%UserProfile%\AppData\Local\Microsoft\Windows\FileHistory" RD /S /Q "%UserProfile%\AppData\Local\Microsoft\Windows\FileHistory"