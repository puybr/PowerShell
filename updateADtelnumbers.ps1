Import-Module ActiveDirectory
# # #
$users = import-csv C:\scripts\userddphonestest.csv
Foreach ($user in $users) {
    Get-Aduser -filter * -Properties * | ? {$_.UserPrincipalName -eq $user.EmailAddress } | Set-ADUser -OfficePhone $user.Tel
} 
