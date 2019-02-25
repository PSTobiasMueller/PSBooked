function Get-BookedUser {
<#
.Synopsis
	Retrieves Users from Booked Scheduler Instance.

.DESCRIPTION
	Retrieves one or all Users from Booked Scheduler Instance

.PARAMETER UserID
	When specified only the specific User is returned.

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$UserID
    )

    begin {
        Assert-BookedConnection
    }

    process {
        If ($UserID) {
            Invoke-Booked -Method "GET" -Action "Web/Services/Users/$($UserID)"
        }
        else {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Users/"
            $_Result.Users
        }
    }
}
