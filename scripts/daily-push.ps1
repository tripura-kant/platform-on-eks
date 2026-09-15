# Auto-commits and pushes any local changes in this repo. Run daily via Windows Task Scheduler.

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$logFile = Join-Path $repoRoot "scripts\daily-push.log"

function Write-Log($message) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $logFile -Append -Encoding utf8
}

Set-Location $repoRoot

try {
    git add -A
    $staged = git diff --cached --name-only

    if ([string]::IsNullOrWhiteSpace($staged)) {
        Write-Log "No changes to commit."
    } else {
        $commitMessage = "auto: daily sync $(Get-Date -Format 'yyyy-MM-dd')"
        git commit -m $commitMessage
        Write-Log "Committed: $commitMessage"
    }

    $branch = git rev-parse --abbrev-ref HEAD
    git push origin $branch
    Write-Log "Pushed branch '$branch' to origin."
}
catch {
    Write-Log "ERROR: $($_.Exception.Message)"
    exit 1
}
