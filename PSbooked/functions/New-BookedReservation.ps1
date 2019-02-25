function New-BookedReservation {
    <#
.Synopsis
	Creates a new Reservation in the Booked Scheduler Instance

.DESCRIPTION
    Creates a new Reservation in the Booked Scheduler Instance

.PARAMETER Title
    Title of the Reservation

.PARAMETER Description
    Description of the Reservation

.PARAMETER StartDateTime
    Start Date and Time of the Reservation

.PARAMETER EndDateTime
    End Date and Time of the Reservation

.PARAMETER ResourceID
    Resources who'll be reserved

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [System.String]$Title,
        [System.String]$Description,
        [Parameter(Mandatory = $true)]
        [System.DateTime]$StartDateTime,
        [Parameter(Mandatory = $true)]
        [System.String]$EndDateTime,
        [Parameter(Mandatory = $true)]
        [System.Int16[]]$ResourceID,
        [Parameter(Mandatory = $true)]
        [System.Int16]$UserID
    )

    begin {
        Assert-BookedConnection
    }

    process {

        $Hash = @{
            "title"               = $Title
            "startDateTime"       = $StartDateTime.ToString("o")
            "endDateTime"         = $EndDateTime
            "userId"              = $UserID
            "description"         = $Description
            "accessories"         = @{}
            "customAttributes"    = @{}
            "invitees"            = @{}
            "participants"        = @{}
            "participatingGuests" = @{}
            "invitedGuests"       = @{}
            "recurrenceRule"      = @{}
            "startReminder"       = ""
            "endReminder"         = ""
            "allowParticipation"  = ""
            "retryParameters"     = ""
            "termsAccepted"       = ""
            "resourceId"          = $ResourceID[0]
            "resources"           = $ResourceID
        }

        Invoke-Booked -Method "POST" -Action "Web/Services/index.php/Reservations/" -Data $Hash
    }
}
