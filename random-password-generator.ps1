function Get-RandomCharacters($length, $characters) {
$random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
return [String]$characters[$random]

}

$letters = Get-RandomCharacters -length 8 -characters 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghiklmnoprstuvwxyz'
$specialcharacters = Get-RandomCharacters -length 3 -characters '!$%&.+'
$string = $letters + $specialcharacters
$string = $string.replace(' ', '')
$arr = $string.ToCharArray()
$password = $arr | Sort-Object {Get-Random}
$y = $password -join ' '
$p = $y.replace(' ', '')

Write-Host $p
