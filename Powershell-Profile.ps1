function prompt {
    Write-Host "PSCore" -nonewline -foregroundcolor Magenta
    Write-Host " $(get-location)>"  -nonewline
    return ' '
}

function Set-AzSubscription-Test {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("sub1", 
            "sub2",
            "sub3")]
        [string] $SubscriptionName
    )

    $SharedServicesSubName = "subname1"
    $ProdSubName = "subname2"
    $SandboxSubName = "subname3"
    
    switch ($SubscriptionName) {
        "Sub 1" {  

            try {
                $SubscriptionContext = Get-AzSubscription -SubscriptionName $SharedServicesLSubName -Verbose
            }
            catch {
                Write-Error "Subscription $sub 1 not found in tenant"
            }
          
            Set-AzContext -SubscriptionObject $SubscriptionContext | Format-List -ErrorAction Stop

        }

        "sub 3" {              
            
            try {
                $SubscriptionContext = Get-AzSubscription -SubscriptionName $sub3 -Verbose
            }
            catch {
                Write-Error "Subscription sub3 not found in tenant"
            }
      
            Set-AzContext -SubscriptionObject $SubscriptionContext | Format-List -ErrorAction Stop
    
        }

        "sub 4" {  

            try {
                $SubscriptionContext = Get-AzSubscription -SubscriptionName $sub3 -Verbose
            }
            catch {
                Write-Error "Subscription $sub3 not found in tenant"
            }
          
            Set-AzContext -SubscriptionObject $SubscriptionContext | Format-List -ErrorAction Stop
        }
    }
}

function Set-AzSubscription-Prod {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("sub1", 
            "sub2",
            "sub3",
            "sub4")]
        [string] $SubscriptionName
    )

    $sub1 = "sub1"
    $sub2 = "sub2"
    $sub3 = "sub3"
    $sub4 = "sub4"


    switch ($SubscriptionName) {
        sub1 {  

            try {
                $SubscriptionContext = Get-AzSubscription -SubscriptionName $sub1 -Verbose
            }
            catch {
                Write-Error "Subscription $sub1 not found in tenant"
            }
          
            Set-AzContext -SubscriptionObject $SubscriptionContext | Format-List -ErrorAction Stop

        }


        sub2 {              
            
            try {
                $SubscriptionContext = Get-AzSubscription -SubscriptionName $sub2 -Verbose
            }
            catch {
                Write-Error "Subscription $sub2 not found in tenant"
            }
      
            Set-AzContext -SubscriptionObject $SubscriptionContext | Format-List -ErrorAction Stop
    
        }

        $sub3 {  

            try {
                $SubscriptionContext = Get-AzSubscription -SubscriptionName $sub3 -Verbose
            }
            catch {
                Write-Error "Subscription $sub3 not found in tenant"
            }
          
            Set-AzContext -SubscriptionObject $SubscriptionContext | Format-List -ErrorAction Stop
        }

        $sub3 {  

            try {
                $SubscriptionContext = Get-AzSubscription -SubscriptionName $sub3 -Verbose
            }
            catch {
                Write-Error "Subscription $sub3 not found in tenant"
            }
          
            Set-AzContext -SubscriptionObject $SubscriptionContext | Format-List -ErrorAction Stop
        }
    }
}

$psCoreLatest = (Invoke-RestMethod https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/metadata.json).StableReleaseTag
$latestVersion = $psCoreLatest -replace 'v',''

$majorVersion = $PSVersionTable.PSVersion.Major
$minorVersion = $PSVersionTable.PSVersion.Minor
$patchVersion = $PSVersionTable.PSVersion.Patch
$currentVersion = "$majorVersion" + '.' + "$minorVersion" + '.' + "$patchVersion"

if ($latestVersion -ne $currentVersion) {
    
    Write-Host "There is a new stable version of Powershell Core.  Version $latestVersion is available." -ForegroundColor Green

    Write-Host "============ Powershell Core Upgrade =========="
    Write-Host "1: Enter 1 to install Powershell Core version $latestVersion"
    Write-Host "2: Enter 2 to exit"

    $option = Read-Host "Enter option here"

    switch ($option) {
        1 { Write-Host "Installing Powershell Version $latestVersion" 
            iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI" }
        2 { Write-Host "Terminating installation" -ForegroundColor Red
            break }
    }
}
else {
    
    Write-Host "The latest version of Powershell Core is $latestVersion.  No new version is available" -ForegroundColor Yellow
}
