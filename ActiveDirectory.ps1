Import-Module ActiveDirectory

# # # USEFUL AD ONE LINERS

Search-ADAccount -Lockedout | Unlock-AdAccount -Confirm
Get-Aduser -filter * -Properties * -SearchBase "OU=Standard,OU=Users,OU=Brighton,OU=Vero Screening,DC=veroscreening,DC=local" | ? {$_.PasswordExpired -eq $True} | Ft Name
Get-Aduser -filter * -Properties * -SearchBase "OU=Standard,OU=Users,OU=Brighton,OU=Vero Screening,DC=veroscreening,DC=local" | ? {$_.PasswordNeverExpires -eq $True} | Ft Name
