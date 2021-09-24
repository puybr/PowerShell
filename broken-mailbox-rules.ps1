# Connect to Exchange Online
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName user@domain.com

# Broken Mailbox Rules
$mailboxes = Get-Mailbox
$OutputFile = "C:\scripts\broken-mailbox-rules.csv"
$MailboxInfo = @()

foreach ($mailbox in $mailboxes) { 
    $rules = Get-InboxRule -Mailbox $mailbox.primarySmtpAddress
    foreach ($rule in $rules) {
        if ($rule.InError -eq "True") {
            $MailboxInfo += New-Object PSObject -Property @{
            Mailbox = $mailbox.primarySmtpAddress;
            Name = $rule.name;
            RuleId = $rule.RuleIdentity
            } | Select-Object -Property Mailbox, Name, RuleId | Export-Csv -Path $OutputFile -NoTypeInformation -Append -Force
        }
    }
}

# Shorthand Method
Get-mailbox | % { Get-Inboxrule -Mailbox $_.name | ? { $_.InError -eq $true } } | Select-Object -property MailboxOwnerid, name, ruleidentity | export-csv -Path C:\brokenrulez.csv -NoTypeInformation
