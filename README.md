# 🚀 PowerShell

## Object Properties
In the programming world, an object’s properties are attributes about the object itself. A property could be a _text string_, a _number_, a _timestamp_, or any other descriptive value.
Whenever we run the `Get-` cmdlet, you are asking the computer to get a a single object or set of objects.

```powershell
Get-HotFix
Get-ComputerInfo -Property WindowsProductId
```

## File Handling
```powershell
New-Item -Path 'C:\temp\test\Create File' -ItemType Directory
New-Item -Path 'C:\temp\test\test.html' -ItemType File
```

## ForEach

```powershell
"Microsoft.PowerShell.Core", "Microsoft.PowerShell.Host" | ForEach-Object {$_.Split(".")}
```
