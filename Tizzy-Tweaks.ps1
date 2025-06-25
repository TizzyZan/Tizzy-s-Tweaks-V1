<#
.SYNOPSIS
  Tizzy’s Tweaks – Windows Utility (fork of Chris Titus Tech’s WinUtil)
.DESCRIPTION
  Full suite: Install (Winget), Tweaks, Config, Updates, MicroWin, Utilities.
.AUTHOR
  Tizzy (forked from Chris Titus Tech)
.LICENSE
  MIT License — includes original WinUtil code under same license.
#>

[CmdletBinding(DefaultParameterSetName='Menu')]
param (
    [Switch]$Install, [Switch]$Tweaks, [Switch]$Config,
    [Switch]$Updates, [Switch]$Utilities, [Switch]$MicroWin, [Switch]$All
)

function Show-Banner {
    Clear-Host
    Write-Host "=================================" -ForegroundColor Cyan
    Write-Host "      Tizzy’s Tweaks v1.0       " -ForegroundColor Cyan
    Write-Host "=================================" -ForegroundColor Cyan
}

function Do-Install {
    Write-Host "`n== Installing Apps (Winget) ==" -ForegroundColor Green
    # Example: winget installs
    # winget install --silent Microsoft.VisualStudioCode
}

function Do-Tweaks {
    Write-Host "`n== Applying System Tweaks ==" -ForegroundColor Green
    # Example tweak:
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value 0
}

function Do-Config {
    Write-Host "`n== Configuring System Settings ==" -ForegroundColor Green
    # Config examples
}

function Do-Updates {
    Write-Host "`n== Windows Update Controls ==" -ForegroundColor Green
    # Update control examples
}

function Do-Utilities {
    Write-Host "`n== Running Utilities ==" -ForegroundColor Green
    # Utilities examples
}

function Do-MicroWin {
    Write-Host "`n== Creating MicroWin ISO ==" -ForegroundColor Green
    # MicroWin ISO builder commands
}

function Process-All {
    Do-Install; Do-Tweaks; Do-Config; Do-Updates; Do-Utilities; Do-MicroWin
}

function Menu-Loop {
    Show-Banner
    Write-Host "[1] Install Apps (Winget)"
    Write-Host "[2] System Tweaks"
    Write-Host "[3] System Config"
    Write-Host "[4] Windows Update Controls"
    Write-Host "[5] Utilities"
    Write-Host "[6] MicroWin ISO Builder"
    Write-Host "[A] All"
    Write-Host "[Q] Quit"
    do {
        $sel = Read-Host "`nChoose an option"
        switch ($sel.ToUpper()) {
            '1' { Do-Install }
            '2' { Do-Tweaks }
            '3' { Do-Config }
            '4' { Do-Updates }
            '5' { Do-Utilities }
            '6' { Do-MicroWin }
            'A' { Process-All }
            'Q' { break }
            default { Write-Host "Invalid selection" -ForegroundColor Red }
        }
    } while ($sel.ToUpper() -ne 'Q')
}

# Automatic mode
if ($All) { Process-All; return }
elseif ($Install) { Do-Install; return }
elseif ($Tweaks) { Do-Tweaks; return }
elseif ($Config) { Do-Config; return }
elseif ($Updates) { Do-Updates; return }
elseif ($Utilities) { Do-Utilities; return }
elseif ($MicroWin) { Do-MicroWin; return }

# Interactive
Menu-Loop
Write-Host "`nThank you for using Tizzy’s Tweaks!" -ForegroundColor Cyan