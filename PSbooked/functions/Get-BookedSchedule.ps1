function Get-BookedSchedule {
<#
.Synopsis
	Retrieves all or a specified Schedule from the Booked Scheduler Instance

.DESCRIPTION
    Retrieves all or a specified Schedule from the Booked Scheduler Instance

.PARAMETER ScheduleID
    Retrieves Only Data from the specified Schedule

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$ScheduleID
    )

    begin {
        Assert-BookedConnection
    }

    process {
        If ($ScheduleID) {
            Invoke-Booked -Method "GET" -Action "Web/Services/Schedules/$($ScheduleID)"
        }
        else {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Schedules"
            $_Result.Schedules
        }
    }
}
