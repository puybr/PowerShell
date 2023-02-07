
# Connect to Exchange Online
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName name@domain.com
Import-Module MSOnline
Connect-MsolService

### IN HOUSE EXCHANGE ###
$ExchSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri 'http://mailserver.domain.local/PowerShell/'
Import-PSSession $ExchSession
### New Mailbox
New-RemoteMailbox -Name "Mailbox Name" -UserPrincipalName "mailbox@domain.com" -OnPremisesOrganizationalUnit "OU=MailoxOU,OU=Users,OU=Org,DC=domain,DC=local"

Get-Mailbox -Public
