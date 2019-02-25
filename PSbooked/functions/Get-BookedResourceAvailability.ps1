function Get-BookedResourceAvailability {
<#
.Synopsis
	Retrieves the Availabilty for a Resources from the Booked Scheduler Instance

.DESCRIPTION
    Retrieves the Availabilty for a Resources from the Booked Scheduler Instance

.PARAMETER ResourceID
    Retrieves Only Data from the specified Resource

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$ResourceID,
        [System.String]$DateTime
    )

    begin {
        Assert-BookedConnection
    }

    process {

        $Query = "dateTime=$DateTime"

        If ($ResourceID) {
            $_Result =  Invoke-Booked -Method "GET" -Action "Web/Services/Resources/$($ResourceID)/Availability" -Data $Hash -Query $Query
            $_Result.Resources
        }
        else {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Resources/Availability" -Data $Hash -Query $Query
            $_Result.Resources
        }
    }
}
