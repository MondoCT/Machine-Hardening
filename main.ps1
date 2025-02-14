# main.ps1

function Harden-Chrome {
    Write-Output "Hardening Google Chrome..."
    $chromePrefsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences"
    if (Test-Path $chromePrefsPath) {
        $chromePrefsJson = Get-Content $chromePrefsPath -Raw | ConvertFrom-Json

        # Disable password saving
        $chromePrefsJson.profile.password_manager_enabled = $false

        # Disable autofill
        $chromePrefsJson.profile.autofill_enabled = $false

        # Disable browser sign-in
        $chromePrefsJson.profile.signin_allowed = $false

        # Disable third-party cookies
        $chromePrefsJson.profile.default_content_setting_values.cookies = 2

        # Enable Safe Browsing
        $chromePrefsJson.safebrowsing.enabled = $true

        $chromePrefsJson | ConvertTo-Json -Compress | Set-Content $chromePrefsPath
    }
    # Additional hardening steps can be added here
}

function Harden-Edge {
    Write-Output "Hardening Microsoft Edge..."
    $edgePrefsPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Preferences"
    if (Test-Path $edgePrefsPath) {
        $edgePrefsJson = Get-Content $edgePrefsPath -Raw | ConvertFrom-Json

        # Disable password saving
        $edgePrefsJson.profile.password_manager_enabled = $false

        # Disable autofill
        $edgePrefsJson.profile.autofill_enabled = $false

        # Disable browser sign-in
        $edgePrefsJson.profile.signin_allowed = $false

        # Disable third-party cookies
        $edgePrefsJson.profile.default_content_setting_values.cookies = 2

        # Enable Safe Browsing
        $edgePrefsJson.safebrowsing.enabled = $true

        $edgePrefsJson | ConvertTo-Json -Compress | Set-Content $edgePrefsPath
    }
    # Additional hardening steps can be added here
}

function Main {
    $choice = Read-Host "Select browser to harden (Chrome/Edge/Both)"
    switch ($choice.ToLower()) {
        "chrome" { Harden-Chrome }
        "edge" { Harden-Edge }
        "both" {
            Harden-Chrome
            Harden-Edge
        }
        default { Write-Output "Invalid selection. Please choose Chrome, Edge, or Both." }
    }
}

Main