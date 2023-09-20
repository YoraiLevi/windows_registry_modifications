:: Created by: Shawn Brink
:: Created on: December 29, 2022
:: Tutoria: https://www.elevenforum.com/t/find-and-save-windows-spotlight-images-in-windows-11.11556/


md "%UserProfile%\Desktop\WindowsSpotlightImages"

copy "%LocalAppData%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\*.*" "%UserProfile%\Desktop\WindowsSpotlightImages"

cd "%UserProfile%\Desktop\WindowsSpotlightImages"

ren * *.jpg