:: Created by: Shawn Brink
:: Created on: November 8, 2021
:: Tutorial: https://www.elevenforum.com/t/turn-on-or-off-adaptive-brightness-in-windows-11.2618/


powercfg -setdcvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 0

powercfg -SetActive SCHEME_CURRENT