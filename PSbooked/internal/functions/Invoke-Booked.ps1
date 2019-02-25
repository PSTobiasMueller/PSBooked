<#
	.Synopsis
		INTERNAL - HTTP-POST against booked API

	.DESCRIPTION
		A detailed description of the Invoke-booked function.

	.PARAMETER Method
		A description of the Method parameter.

	.Parameter Data
		Hashtable with parameters

	.PARAMETER Header
		A description of the Header parameter.

	.NOTES
		Additional information about the function.
#>
function Invoke-Booked
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [string]$Action,
        [string]$Method="GET",
        [string]$Query,
        [hashtable]$Data,
        [hashtable]$Header
    )

    If ($verbose)
    {
        $ProgressPreference = "Continue"
    }
    else
    {
        $ProgressPreference = "SilentlyContinue"
    }


    try
    {

        $Body = ConvertTo-Json $Data -Depth 4 -Compress

        $Uri = "$($script:_connectUri)/$($Action)"
        if ($Query) {
            $Uri += "?$($Query)"
        }
        If ($script:_connectSessionToken)
        {
            $Header = @{
                "X-Booked-SessionToken" = $script:_connectSessionToken
                "X-Booked-UserId" = $script:_connectUserId}
        }

        #If ($Action -notlike "*Authentication*") {
        #    $Uri = $Uri -replace "https", "http"
        #}

        # Get Data from booked API
        Write-PSFMessage -Level SomewhatVerbose "Connect to Booked API"
        $_rest = Invoke-RestMethod -Method $Method -Uri $Uri -Body $Body -Headers $Header -ContentType "application/json"
    }

    catch
    {
        Throw $_
    }

    # Check the Results
    if ($_rest)
    {
        $_rest
    }
    ElseIf ($_rest.error)
    {
        $ErrorObject = New-Object System.Net.WebSockets.WebSocketException ($_rest.error.code, "$($_rest.error.message) - $($_rest.error.data.error)")
        Throw $ErrorObject
    }
    else
    {
        Write-PSFMessage -Level SomewhatVerbose "Nothing found for $Method"
    }



}
