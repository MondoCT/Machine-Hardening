function Harden-Chrome {
    Write-Output "Hardening Google Chrome..."
    $chromePrefsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences"
    if (Test-Path $chromePrefsPath) {
        $chromePrefsJson = Get-Content $chromePrefsPath -Raw | ConvertFrom-Json

        # Ensure profile object exists
        if (-not $chromePrefsJson.PSObject.Properties.Match('profile')) {
            $chromePrefsJson | Add-Member -MemberType NoteProperty -Name 'profile' -Value @{}
        }

        # Disable password saving
        $chromePrefsJson.profile.password_manager_enabled = $false

        # Disable autofill
        $chromePrefsJson.profile.autofill_enabled = $false

        # Disable browser sign-in
        $chromePrefsJson.profile.signin_allowed = $false

        # Ensure default_content_setting_values object exists
        if (-not $chromePrefsJson.profile.PSObject.Properties.Match('default_content_setting_values')) {
            $chromePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'default_content_setting_values' -Value @{}
        }

        # Disable third-party cookies
        $chromePrefsJson.profile.default_content_setting_values.cookies = 2

        # Ensure safebrowsing object exists
        if (-not $chromePrefsJson.PSObject.Properties.Match('safebrowsing')) {
            $chromePrefsJson | Add-Member -MemberType NoteProperty -Name 'safebrowsing' -Value @{}
        }

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

        # Ensure profile object exists
        if (-not $edgePrefsJson.PSObject.Properties.Match('profile')) {
            $edgePrefsJson | Add-Member -MemberType NoteProperty -Name 'profile' -Value @{}
        }

        # Disable password saving
        $edgePrefsJson.profile.password_manager_enabled = $false

        # Disable autofill
        $edgePrefsJson.profile.autofill_enabled = $false

        # Disable browser sign-in
        $edgePrefsJson.profile.signin_allowed = $false

        # Ensure default_content_setting_values object exists
        if (-not $edgePrefsJson.profile.PSObject.Properties.Match('default_content_setting_values')) {
            $edgePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'default_content_setting_values' -Value @{}
        }

        # Disable third-party cookies
        $edgePrefsJson.profile.default_content_setting_values.cookies = 2

        # Ensure safebrowsing object exists
        if (-not $edgePrefsJson.PSObject.Properties.Match('safebrowsing')) {
            $edgePrefsJson | Add-Member -MemberType NoteProperty -Name 'safebrowsing' -Value @{}
        }

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