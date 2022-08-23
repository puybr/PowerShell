# Move computer objects to OU
Import-Module ActiveDirectory
$computers = import-csv C:\scripts\computers.csv

# Get all the computers in an OU
Get-ADcomputer -Filter * -SearchBase "OU=Taget,DC=local" | Sort-Object -Property Name | ft Name

Foreach ($computer in $computers) {
Get-ADComputer $computer.name | Move-ADObject -TargetPath "OU=Taget,DC=local" -Verbose
}

## Script to add all computers in ou to an AD group
$laptops = Get-ADComputer -Filter * -SearchBase "OU=Taget,DC=local" -SearchScope 2 | Where-Object {($_.Name -match "LAPTOP*") -or ($_.Name -match "COMPUTER*")}
foreach ($laptop in $laptops) {
    Remove-ADGroupMember "Group Name" -Members $laptop -Confirm:$false
    Add-ADGroupMember "Group Name" -Members $laptop
}
