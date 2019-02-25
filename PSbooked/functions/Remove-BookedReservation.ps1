function Remove-BookedReservation {
<#
.Synopsis
	Removes the specified Reservation from the Booked Scheduler Instance

.DESCRIPTION
    Removes the specified Reservation from the Booked Scheduler Instance

.PARAMETER ReferenceNumber
    Reference Number of the Reservation to remove

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [System.String]$ReferenceNumber,
        [System.String]$UpdateScope

    )

    begin {
        Assert-BookedConnection
    }

    process {

        if ($UpdateScope) {
            $Query = "UpdateScope=$UpdateScope"
        }
        $_Result = Invoke-Booked -Method "DELETE" -Action "Web/Services/Reservations/$($ReferenceNumber)" -Query $Query
        If ($_Result.Message) {
            $_Result.Message
        }
        else {
            Write-Warning -Message "Reference Item not found."
        }
    }
}
