# Updated function from https://github.com/ChrisTitusTech/powershell-profile/blob/main/Microsoft.PowerShell_profile.ps1
function Update-PowerShell {
    if (-not (Test-Connection github.com -Count 1 -Quiet -TimeoutSeconds 1)) {
        Write-Host "Skipping PowerShell update check due to GitHub.com not responding within 1 second." -ForegroundColor Yellow
        return
    }

    try {
        Write-Host "Checking for PowerShell updates..." -ForegroundColor Cyan
        $updateNeeded = $false
        $currentVersion = $PSVersionTable.PSVersion.ToString()
        $gitHubApiUrl = "https://api.github.com/repos/PowerShell/PowerShell/releases/latest"
        $latestReleaseInfo = Invoke-RestMethod -Uri $gitHubApiUrl
        $latestVersion = $latestReleaseInfo.tag_name.Trim('v')
        if ($currentVersion -lt $latestVersion) {
            $updateNeeded = $true
        }

        if ($updateNeeded) {
            Write-Host "Updating PowerShell..." -ForegroundColor Yellow
            winget upgrade "Microsoft.PowerShell" --accept-source-agreements --accept-package-agreements
            Write-Host "PowerShell has been updated. Please restart your shell to reflect changes" -ForegroundColor Magenta
        } else {
            Write-Host "Your PowerShell is up to date." -ForegroundColor Green
        }
    } catch {
        Write-Error "Failed to update PowerShell. Error: $_"
    }
}
Update-PowerShell

# ┌—————————┐
# │ ALIASES │
# └—————————┘
Set-Alias -Name vim -Value nvim
Set-Alias -Name re -Value reload
function notes { nvim C:/Users/J/Documents/notepad.txt }
function ll { ls -Force }
function ff { fastfetch -c C:/Users/J/Documents/.ff-config.jsonc -l C:/Users/J/Documents/icon.txt }
function shutdown { Stop-Computer -ComputerName localhost -Force }
function reboot { Stop-Computer /r -ComputerName localhost -Force }
function touch($file) { "" | Out-File $file -Encoding ASCII }
function uptime { (Get-CimInstance Win32_OperatingSystem -ComputerName $_.Name).LastBootUpTime }
function reload { . $PROFILE }
function htop { while(1) { ps | sort -des cpu | select -f 15 | ft -a; sleep 1; cls } }

# ┌————————┐
# │ PROMPT │
# └————————┘
Invoke-Expression (& { (zoxide init powershell | Out-String) })
oh-my-posh init pwsh --config 'C:\Users\J\AppData\Local\Programs\oh-my-posh\themes\jblab_2021.omp.json' | Invoke-Expression

#ff
