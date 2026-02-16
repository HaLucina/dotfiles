$importPath = Join-Path $PSScriptRoot "..\apps.txt"

if (Test-Path $importPath) {
    Write-Host "Importing apps from $importPath..." -ForegroundColor Cyan
    scoop import $importPath
    
    Write-Host "Resetting all shims..." -ForegroundColor Cyan
    scoop reset *
    Write-Host "Sync Complete!" -ForegroundColor Green
} else {
    Write-Error "Error: apps.txt not found at $importPath"
}