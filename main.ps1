function Harden-Chrome {
    Write-Output "Hardening Google Chrome..."
    $chromePrefsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences"
    if (Test-Path $chromePrefsPath) {
        $chromePrefsJson = Get-Content $chromePrefsPath -Raw | ConvertFrom-Json

        # Ensure profile object exists
        if (-not $chromePrefsJson.PSObject.Properties.Match('profile')) {
            $chromePrefsJson | Add-Member -MemberType NoteProperty -Name 'profile' -Value @{}
        }

        # Ensure password_manager_enabled property exists
        if (-not $chromePrefsJson.profile) {
            $chromePrefsJson.profile = @{}
        }
        if (-not $chromePrefsJson.profile.PSObject.Properties.Match('password_manager_enabled')) {
            $chromePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'password_manager_enabled' -Value $false
        } else {
            $chromePrefsJson.profile.password_manager_enabled = $false
        }

        # Ensure autofill_enabled property exists
        if (-not $chromePrefsJson.profile.PSObject.Properties.Match('autofill_enabled')) {
            $chromePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'autofill_enabled' -Value $false
        } else {
            $chromePrefsJson.profile.autofill_enabled = $false
        }

        # Ensure signin_allowed property exists
        if (-not $chromePrefsJson.profile.PSObject.Properties.Match('signin_allowed')) {
            $chromePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'signin_allowed' -Value $false
        } else {
            $chromePrefsJson.profile.signin_allowed = $false
        }

        # Ensure default_content_setting_values object exists
        if (-not $chromePrefsJson.profile.PSObject.Properties.Match('default_content_setting_values')) {
            $chromePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'default_content_setting_values' -Value @{}
        }

        # Ensure cookies property exists
        if (-not $chromePrefsJson.profile.default_content_setting_values) {
            $chromePrefsJson.profile.default_content_setting_values = @{}
        }
        if (-not $chromePrefsJson.profile.default_content_setting_values.PSObject.Properties.Match('cookies')) {
            $chromePrefsJson.profile.default_content_setting_values | Add-Member -MemberType NoteProperty -Name 'cookies' -Value 2
        } else {
            $chromePrefsJson.profile.default_content_setting_values.cookies = 2
        }

        # Ensure safebrowsing object exists
        if (-not $chromePrefsJson.PSObject.Properties.Match('safebrowsing')) {
            $chromePrefsJson | Add-Member -MemberType NoteProperty -Name 'safebrowsing' -Value @{}
        }

        # Ensure enabled property exists
        if (-not $chromePrefsJson.safebrowsing) {
            $chromePrefsJson.safebrowsing = @{}
        }
        if (-not $chromePrefsJson.safebrowsing.PSObject.Properties.Match('enabled')) {
            $chromePrefsJson.safebrowsing | Add-Member -MemberType NoteProperty -Name 'enabled' -Value $true
        } else {
            $chromePrefsJson.safebrowsing.enabled = $true
        }

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

        # Ensure password_manager_enabled property exists
        if (-not $edgePrefsJson.profile) {
            $edgePrefsJson.profile = @{}
        }
        if (-not $edgePrefsJson.profile.PSObject.Properties.Match('password_manager_enabled')) {
            $edgePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'password_manager_enabled' -Value $false
        } else {
            $edgePrefsJson.profile.password_manager_enabled = $false
        }

        # Ensure autofill_enabled property exists
        if (-not $edgePrefsJson.profile.PSObject.Properties.Match('autofill_enabled')) {
            $edgePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'autofill_enabled' -Value $false
        } else {
            $edgePrefsJson.profile.autofill_enabled = $false
        }

        # Ensure signin_allowed property exists
        if (-not $edgePrefsJson.profile.PSObject.Properties.Match('signin_allowed')) {
            $edgePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'signin_allowed' -Value $false
        } else {
            $edgePrefsJson.profile.signin_allowed = $false
        }

        # Ensure default_content_setting_values object exists
        if (-not $edgePrefsJson.profile.PSObject.Properties.Match('default_content_setting_values')) {
            $edgePrefsJson.profile | Add-Member -MemberType NoteProperty -Name 'default_content_setting_values' -Value @{}
        }

        # Ensure cookies property exists
        if (-not $edgePrefsJson.profile.default_content_setting_values) {
            $edgePrefsJson.profile.default_content_setting_values = @{}
        }
        if (-not $edgePrefsJson.profile.default_content_setting_values.PSObject.Properties.Match('cookies')) {
            $edgePrefsJson.profile.default_content_setting_values | Add-Member -MemberType NoteProperty -Name 'cookies' -Value 2
        } else {
            $edgePrefsJson.profile.default_content_setting_values.cookies = 2
        }

        # Ensure safebrowsing object exists
        if (-not $edgePrefsJson.PSObject.Properties.Match('safebrowsing')) {
            $edgePrefsJson | Add-Member -MemberType NoteProperty -Name 'safebrowsing' -Value @{}
        }

        # Ensure enabled property exists
        if (-not $edgePrefsJson.safebrowsing) {
            $edgePrefsJson.safebrowsing = @{}
        }
        if (-not $edgePrefsJson.safebrowsing.PSObject.Properties.Match('enabled')) {
            $edgePrefsJson.safebrowsing | Add-Member -MemberType NoteProperty -Name 'enabled' -Value $true
        } else {
            $edgePrefsJson.safebrowsing.enabled = $true
        }

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