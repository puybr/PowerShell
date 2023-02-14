
# Connect to Exchange Online
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName name@domain.com
Import-Module MSOnline
Connect-MsolService

### IN HOUSE EXCHANGE ###
$ExchSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri 'http://mailserver.domain.local/PowerShell/'
Import-PSSession $ExchSession
### New Mailbox
New-RemoteMailbox -Name "Mailbox Name" -UserPrincipalName "mailbox@domain.com" -OnPremisesOrganizationalUnit "OU=MailboxOU,OU=Users,OU=Org,DC=domain,DC=local"

Get-Mailbox -Public

#### ARRAY to ADD users to *SHARED* mailbox
$sharedMailbox = "shared@domain.com"
$userMailboxes = "Sarah Connor"
Foreach ($userMailbox in $userMailboxes) { 
    Add-MailboxPermission -Identity $sharedMailbox -User $userMailbox -AccessRights FullAccess -InheritanceType All -AutoMapping $false
}
