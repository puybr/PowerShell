Param (
	[string]$Path = "c:\temp",
	[string]$SearchBase = "OU=Users, OU=Company, DC=local",
	[int]$Age = 2
)

cls
## set associative array
$Result = @()

#region Determine MaxPasswordAge
#Determine MaxPasswordAge which should be 60 days
$maxPasswordAgeTimeSpan = $null
$maxPasswordAgeTimeSpan = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge
If ($maxPasswordAgeTimeSpan -eq $null -or $maxPasswordAgeTimeSpan.TotalMilliseconds -eq 0) 
{	Write-Host "MaxPasswordAge is not set for the domain or is set to zero!"
	Write-Host "So no password expiration's possible."
	Exit
}
#endregion

$Users = Get-ADUser -Filter * -SearchBase $SearchBase -SearchScope Subtree -Properties GivenName,sn,PasswordExpired,PasswordLastSet,PasswordneverExpires,LastLogonDate
ForEach ($User in $Users)
{	If ($User.PasswordNeverExpires -or $User.PasswordLastSet -eq $null)
	{	Continue
	}
	$Expiration = $User.PasswordLastSet + $maxPasswordAgeTimeSpan
	If ((New-TimeSpan -Start (Get-Date) -End $Expiration).Days -le $Age)
	{	$Result += New-Object PSObject -Property @{
			'Last Name' = $User.sn
			'First Name' = $User.GivenName
			UserName = $User.SamAccountName
			'Expiration Date' = $Expiration
			'Last Logon Date' = $User.LastLogonDate
			State = If ($User.Enabled) { "" } Else { "Disabled" }
		}
	}
}
$Result = $Result | Select 'Last Name','First Name',UserName,'Expiration Date','Last Logon Date',State | Sort 'Expiration Date','Last Name'

#Produce a CSV
$ExportDate = Get-Date -f "yyyy-MM-dd"
$Result | Export-Csv $path\ExpiringReport-$ExportDate.csv -NoTypeInformation
