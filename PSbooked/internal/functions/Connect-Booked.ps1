function Connect-Booked
{

    [System.Net.NetworkCredential]$_UnsecureCredentials = $script:_connectCredentials.GetNetworkCredential()

    $Hash = @{
        "username"= $_UnsecureCredentials.UserName
        "password" = $_UnsecureCredentials.Password
    }

    $_LoginResult = Invoke-Booked -Method "POST" -Action "Web/Services/Authentication/Authenticate" -Data $Hash -ErrorAction Stop
    Remove-Variable "_UnsecureCredentials"

    $_LoginResult
}
