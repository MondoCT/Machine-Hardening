function Ensure-Property {
    param (
        [Parameter(Mandatory=$true)]
        [psobject]$Object,
        [Parameter(Mandatory=$true)]
        [string]$PropertyName,
        [Parameter(Mandatory=$true)]
        $DefaultValue
    )
    if (-not $Object.PSObject.Properties.Match($PropertyName)) {
        $Object | Add-Member -MemberType NoteProperty -Name $PropertyName -Value $DefaultValue
    }
    return $Object.$PropertyName
}

function Harden-Chrome {
    Write-Output "Hardening Google Chrome..."
    $chromePrefsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences"
    if (Test-Path $chromePrefsPath) {
        $chromePrefsJson = Get-Content $chromePrefsPath -Raw | ConvertFrom-Json

        $profile = Ensure-Property -Object $chromePrefsJson -PropertyName 'profile' -DefaultValue @{}
        $profile.password_manager_enabled = $false
        $profile.autofill_enabled = $false
        $profile.signin_allowed = $false

        $defaultContentSettings = Ensure-Property -Object $chromePrefsJson -PropertyName 'default_content_setting_values' -DefaultValue @{}
        $defaultContentSettings.cookies = 2

        $safeBrowsing = Ensure-Property -Object $chromePrefsJson -PropertyName 'safebrowsing' -DefaultValue @{}
        $safeBrowsing.enabled = $true

        $chromePrefsJson | ConvertTo-Json -Compress | Set-Content $chromePrefsPath
    }
    # Additional hardening steps can be added here
}

function Harden-Edge {
    Write-Output "Hardening Microsoft Edge..."
    $edgePrefsPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Preferences"
    if (Test-Path $edgePrefsPath) {
        $edgePrefsJson = Get-Content $edgePrefsPath -Raw | ConvertFrom-Json

        $profile = Ensure-Property -Object $edgePrefsJson -PropertyName 'profile' -DefaultValue @{}
        $profile.password_manager_enabled = $false
        $profile.autofill_enabled = $false
        $profile.signin_allowed = $false

        $defaultContentSettings = Ensure-Property -Object $edgePrefsJson -PropertyName 'default_content_setting_values' -DefaultValue @{}
        $defaultContentSettings.cookies = 2

        $safeBrowsing = Ensure-Property -Object $edgePrefsJson -PropertyName 'safebrowsing' -DefaultValue @{}
        $safeBrowsing.enabled = $true

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