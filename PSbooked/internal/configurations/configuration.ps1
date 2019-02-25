<#
This is an example configuration file

By default, it is enough to have a single one of them,
however if you have enough configuration settings to justify having multiple copies of it,
feel totally free to split them into multiple files.
#>

<#
# Example Configuration
Set-PSFConfig -Module 'PSBooked' -Name 'Example.Setting' -Value 10 -Initialize -Validation 'integer' -Handler { } -Description "Example configuration setting. Your module can then use the setting using 'Get-PSFConfigValue'"
#>

#Path to an Configuration JSON File
$ConfigurationFile = "$($(Get-PSFConfig -Module 'Schriesheim-IT' -Name 'ConfigurationRepository').Value)\PSBooked\PSBooked.json"

Set-PSFConfig -Module 'PSBooked' -Name 'PSBooked.User' -Value '' -Initialize -Validation 'String' -Handler { } -Description "Username for the Connection to the Booked REST API." -ModuleExport
Set-PSFConfig -Module 'PSBooked' -Name 'PSBooked.Server' -Value '' -Initialize -Validation 'String' -Handler { } -Description "Server or FQDN of the Booked Instance to connect to." -ModuleExport


If (Test-Path -Path $ConfigurationFile)
{
    Import-PSFConfig -Path $ConfigurationFile
}