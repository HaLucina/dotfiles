if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop..." -ForegroundColor Cyan
    irm get.scoop.sh | iex
}

# 必須バケツの追加
$buckets = @("main", "extras", "versions")
foreach ($b in $buckets) {
    if (!(scoop bucket list | Select-String $b)) {
        Write-Host "Adding bucket: $b" -ForegroundColor Cyan
        scoop bucket add $b
    }
}
Write-Host "Scoop installation check complete." -ForegroundColor Green