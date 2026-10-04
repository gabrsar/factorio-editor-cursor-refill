$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$info = Get-Content -LiteralPath (Join-Path $repoRoot 'info.json') -Raw | ConvertFrom-Json
$packageName = "$($info.name)_$($info.version)"
$dist = Join-Path $repoRoot 'dist'
$staging = Join-Path $dist $packageName
New-Item -ItemType Directory -Force -Path $staging | Out-Null
foreach ($file in @('info.json', 'control.lua', 'refill.lua', 'LICENSE')) {
    Copy-Item -LiteralPath (Join-Path $repoRoot $file) -Destination $staging -Force
}
$zipPath = Join-Path $dist "$packageName.zip"
Compress-Archive -LiteralPath $staging -DestinationPath $zipPath -Force
Write-Output $zipPath
