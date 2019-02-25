function Get-BookedGroup {
<#
.Synopsis
	Retrieves Groups from Booked Scheduler Instance.

.DESCRIPTION
	Retrieves one or all Groups from Booked Scheduler Instance

.PARAMETER GroupID
	When specified only the specific Group is returned.

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$GroupID
    )

    begin {
        Assert-BookedConnection
    }

    process {
        If ($GroupID) {
            Invoke-Booked -Method "GET" -Action "Web/Services/Groups/$($GroupID)"
        }
        else {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Groups/"
            $_Result.Groups
        }
    }
}
