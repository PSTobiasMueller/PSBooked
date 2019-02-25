function Get-BookedAccessories {
<#
.Synopsis
	Retrieves all or a specified Accessories from the Booked Scheduler Instance

.DESCRIPTION
    Retrieves all or a specified Accessories from the Booked Scheduler Instance

.PARAMETER AccessoriesID
    Retrieves Only Data from the specified Accessories

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$AccessoriesID
    )

    begin {
        Assert-BookedConnection
    }

    process {
        If ($AccessoriesID) {
            Invoke-Booked -Method "GET" -Action "Web/Services/Accessories/$($AccessoriesID)"
        }
        else {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Accessories"
            $_Result.Accessories
        }
    }
}
