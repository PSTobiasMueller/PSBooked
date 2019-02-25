function Get-BookedResourceStatus {
<#
.Synopsis
	Retrieves all Resources Status from the Booked Scheduler Instance

.DESCRIPTION
	Retrieves all Resources Status from the Booked Scheduler Instance

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
    )

    begin {
        Assert-BookedConnection
    }

    process {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Resources/Status"
            $_Result.Statuses
    }
}
