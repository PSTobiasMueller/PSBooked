function Get-BookedResource {
<#
.Synopsis
	Retrieves all or a specified Resources from the Booked Scheduler Instance

.DESCRIPTION
    Retrieves all or a specified Resources from the Booked Scheduler Instance

.PARAMETER ResourceID
    Retrieves Only Data from the specified Resource

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$ResourceID
    )

    begin {
        Assert-BookedConnection
    }

    process {
        If ($ResourceID) {
            Invoke-Booked -Method "GET" -Action "Web/Services/Resources/$($ResourceID)"
        }
        else {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Resources"
            $_Result.Resources
        }
    }
}
