# write_iss_script.ps1

param(
    [Parameter(Mandatory=$true)][String]$PythonVersion,
    [Parameter(Mandatory=$true)][String]$OutFile
)

$File = '.\emmy.iss'
$LineToReplace = '%PLACEHOLDER%'
$NewLine = "${PythonVersion}"

$FileContent = Get-Content -Path $File -Raw

$FileContent.Replace($LineToReplace, $NewLine) | Set-Content -Path .\$OutFile
