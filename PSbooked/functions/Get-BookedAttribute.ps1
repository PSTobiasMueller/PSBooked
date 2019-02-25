function Get-BookedAttribute {
<#
.Synopsis
	Retrieves all or a specified Attribute from the Booked Scheduler Instance

.DESCRIPTION
    Retrieves all or a specified Attribute from the Booked Scheduler Instance

.PARAMETER AttributeID
    Retrieves Only Data from the specified Attribute

.PARAMETER CategoryID
    Retrieves Only Data from the specified Category ID

.NOTES
	Version
	1.0.0   20.02.2019  TM  Inital Release
#>
    [CmdletBinding()]
    param (
        [System.Int16]$AttributeID,
        [System.Int16]$CategoryID
    )

    begin {
        Assert-BookedConnection
    }

    process {
        If ($AttributeID) {
            Invoke-Booked -Method "GET" -Action "Web/Services/Attributes/$($AttributeID)"
        }
        elseif ($CategoryID) {
            $_Result = Invoke-Booked -Method "GET" -Action "Web/Services/Attributes/Category/$($CategoryID)"
            $_Result.Attributes
        }
    }
}
