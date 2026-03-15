# 親ディレクトリ(scoop/)に apps.txt を出力
$exportPath = Join-Path $PSScriptRoot "..\apps.txt"
Write-Host "Exporting apps to $exportPath" -ForegroundColor Cyan
scoop export > $exportPath