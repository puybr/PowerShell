Import-Module ActiveDirectory
# # #
$users = import-csv C:\scripts\userphones.csv
Foreach ($user in $users) {
    Get-Aduser -filter * -Properties * | ? {$_.UserPrincipalName -eq $user.EmailAddress } | Set-ADUser -OfficePhone $user.Tel
} 
