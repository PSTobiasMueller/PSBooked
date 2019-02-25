function Get-BookedReservation {
<#
.Synopsis
	Retrieves all or a specified Reservation from the Booked Scheduler Instance

.DESCRIPTION
    Retrieves all or a specified Reservation from the Booked Scheduler Instance

.PARAMETER ReferenceNumber
    Retrieves Only Data from the specified Reservation

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.String]$ReferenceNumber
    )

    begin {
        Assert-BookedConnection
    }

    process {
        If ($ReferenceNumber) {
            Invoke-Booked -Method "GET" -Action "Web/Services/Reservations/$($ReferenceNumber)"
        }
        else {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Reservations"
            $_Result.Reservations
        }
    }
}
