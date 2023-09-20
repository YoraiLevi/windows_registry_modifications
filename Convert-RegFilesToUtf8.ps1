<#
.SYNOPSIS
This script converts registry files to UTF-8 encoding.

.DESCRIPTION
This script converts registry files to UTF-8 encoding. It is useful when you need to modify registry files that are not in UTF-8 format.

.PARAMETER DirectoryPath
Specifies the path of the directory containing the registry files to convert. If not specified, the current directory is used.

.EXAMPLE
Convert-RegFilesToUtf8 -DirectoryPath "C:\RegistryFiles"

This example converts all registry files in the "C:\RegistryFiles" directory to UTF-8 encoding.

.NOTES
Author: GitHub Copilot
#>
param (
    [string]$DirectoryPath = (Get-Location).Path
)
if (-not (Test-Path $DirectoryPath -PathType Container)) {
    throw "Invalid directory path: $DirectoryPath"
}

function Convert-ToUtf8($filePath) {
    <#
    .SYNOPSIS
    Converts the encoding of a file to UTF-8.

    .PARAMETER filePath
    The path of the file to be converted.

    .EXAMPLE
    Convert-ToUtf8 -filePath "C:\Users\JohnDoe\Documents\example.txt"

    This example converts the encoding of the file located at "C:\Users\JohnDoe\Documents\example.txt" to UTF-8.

    .NOTES
    Author: GitHub Copilot
    #>
    $content = Get-Content $filePath
    Set-Content -Path $filePath -Value $content -Encoding UTF8
}

$regFiles = Get-ChildItem -Path $DirectoryPath -Recurse -Filter *.reg

foreach ($file in $regFiles) {
    Convert-ToUtf8 $file.FullName
}