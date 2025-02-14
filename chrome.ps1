# chrome.ps1

# Function to display the menu and get user selection
function Show-Menu {
    Write-Host "Please select an option:"
    Write-Host "1. Edge"
    Write-Host "2. Chrome"
    Write-Host "3. Both"
    $selection = Read-Host "Enter your choice (1, 2, or 3)"
    return $selection
}

# Function to enable "Delete data sites have saved to your device when you close all windows" for Chrome
function Enable-ChromeSetting {
    $chromeRegistryPath = "HKCU:\Software\Google\Chrome\Profile\Default"
    if (-Not (Test-Path $chromeRegistryPath)) {
        New-Item -Path $chromeRegistryPath -Force | Out-Null
    }
    Set-ItemProperty -Path $chromeRegistryPath -Name "ClearBrowsingDataOnExit" -Value 1
    Write-Host "Chrome setting enabled: Delete data sites have saved to your device when you close all windows."
}

# Main script
$choice = Show-Menu

switch ($choice) {
    1 { Write-Host "You selected Edge" }
    2 { 
        Write-Host "You selected Chrome"
        Enable-ChromeSetting
    }
    3 { Write-Host "You selected Both" }
    default { Write-Host "Invalid selection. Please run the script again and choose a valid option." }
}