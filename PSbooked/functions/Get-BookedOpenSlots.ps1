function Get-BookedOpenSlots {
<#
.Synopsis
	Retrieves Open Slots for a speicifc Schedule Booked Scheduler Instance

.DESCRIPTION
    Retrieves Open Slots for a speicifc Schedule Booked Scheduler Instance

.PARAMETER ScheduleID
    The Schedule that should be searched for open slots

.PARAMETER ResourceID
    Retrieves Only Slots from the specified Resource

.PARAMETER StartDateTime
    Start Date for the Event or Reservation

.PARAMETER EndDateTime
    End Date for the Event or Reservation

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$ScheduleID,
        [System.Int16]$ResourceID,
        [System.String]$StartDate,
        [System.String]$EndDate
    )

    begin {
        Assert-BookedConnection
    }

    process {

        $Query = @()
        if ($ResourceID) {
            $Query += "resourceId=$($ResourceID)"
        }
        if ($StartDate) {
            $Query += "startDateTime=$($StartDate)"
        }
        if ($EndDate) {
            $Query += "endDateTime=$($EndDate)"
        }

        $Query = $Query -join "&"
        Write-Host $Query
        $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Schedules/$($ScheduleID)/Slots" -Query $Query
        $_Result.Dates

    }
}
