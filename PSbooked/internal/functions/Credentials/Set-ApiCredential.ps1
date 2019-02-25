function Set-ApiCredential {
    param (
        [System.Management.Automation.PSCredential]$Credentials
    )
    $script:_connectCredentials = $Credentials
}
