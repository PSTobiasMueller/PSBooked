<#
	.Synopsis
		Initialize the connection to the Booked Rest API .

	.DESCRIPTION
		A detailed description of the Initialize-idoit function.

	.Parameter Server
		Hostname/FQDN/IP of the Booked Server.

	.Parameter Port
		Port of bConnect (default: 443).

	.Parameter ApiKey
		PSCredential-object with permissions in the bMS.

	.PARAMETER Credentials
		A description of the Credentials parameter.

	.PARAMETER AcceptSelfSignedCertificate
		A description of the AcceptSelfSignedCertificate parameter.

	.Parameter AcceptSelfSignedCertificate
		Switch to ignore untrusted certificates.

	.NOTES
		Additional information about the function.
#>
function Initialize-Booked
{
    param
    (
        [Parameter(Mandatory = $true)]
        [string]$Server,
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]$Credentials,
        [switch]$AcceptSelfSignedCertificate
    )

    If ($AcceptSelfSignedCertificate)
    {
        [System.Net.ServicePointManager]::CertificatePolicy = New-Object bConnect.Connection.CertificatePolicy
    }

    $_uri = $Server

    $script:_connectInitialized = $true
    $script:_connectUri = $_uri
    $script:_connectCredentials = $Credentials

    if ($Credentials)
    {
        $_LoginResult = Connect-Booked
    }

    If ($_LoginResult.isAuthenticated -ne $true)
    {
        $script:_connectInitialized = $false
        $script:_connectUri = ""
        $script:_connectCredentials = ""
        $ErrorObject = New-Object System.Net.WebSockets.WebSocketException "$_LoginResult.message"
        Throw $ErrorObject
    }
    else
    {
        $script:_connectSessionToken = $_LoginResult.sessionToken
        $script:_connectUserId = $_LoginResult.userId
        Write-PSFMessage -Level SomewhatVerbose -Message "Verbindung mit $Server hergestellt."
        Write-PSFMessage -Level SomewhatVerbose -Message "booked Version: $($_LoginResult.version)"
        Write-PSFMessage -Level SomewhatVerbose -Message "Logged in: $($_LoginResult.sessionToken) (UserID: $($_LoginResult.userId))"
        Write-PSFMessage -Level SomewhatVerbose -Message "Session Expires: $($_LoginResult.sessionExpires)"
    }
}
