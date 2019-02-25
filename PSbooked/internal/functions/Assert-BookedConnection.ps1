function Assert-BookedConnection
{
<#
	.SYNOPSIS
		Proves a valid connection of sufficient version has been established.

	.DESCRIPTION
		Proves a valid connection of sufficient version has been established.

		Will terminate execution with maximum prejudice if no connection is possible or the version is insufficient.

	.PARAMETER MinVersion
		The minimum Booked version the calling command requires

	.EXAMPLE
		PS C:\> Assert-BookedConnection

		Will throw a terminating exception if no connection is possible at all.
#>
	[CmdletBinding()]
	Param (
		[version]
		$MinVersion = "1.0"
	)

	begin
	{
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug','start','param'
	}
	process
	{
		try
		{
			[version]$_connectVersion = (Connect-Booked -ErrorAction Stop).version
		}
		catch {
			Stop-PSFFunction -Message "Connection could not be validated!" -EnableException $true -Cmdlet $PSCmdlet -ErrorRecord $_
		}
		if (-not ($_connectVersion -ge $MinVersion)) {
			# Terminating Erorr
			# Throw "bConnect has not the Required Version: $MinVersion"
			# No Terminating Error
			Stop-PSFFunction -Message "bConnect has not the Required Version: $MinVersion" -EnableException $true -Cmdlet $PSCmdlet
		}
	}
}
