Import-Module ActiveDirectory

# # # USEFUL AD ONE LINERS

Search-ADAccount -Lockedout | Unlock-AdAccount -Confirm
Get-Aduser -filter * -Properties * | ? {$_.PasswordExpired -eq $True} | Ft Name
Get-Aduser -filter * -Properties * | ? {$_.PasswordNeverExpires -eq $True} | Ft Name
