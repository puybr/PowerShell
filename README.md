# 🚀 PowerShell

# Syntax Rules
Verb > Object > Noun

```powershel
Get-Command -Noun service
```

# Object Properties
In the programming world, an object’s properties are attributes about the object itself. A **property** could be a _text string_, a _number_, a _timestamp_, or any other descriptive value.
Whenever we run the `Get-` cmdlet, you are asking the computer to get a a single object or set of objects.

```powershell
Get-HotFix
Get-Service -Name Spooler
Get-Process notepad | Stop-Process
Get-ComputerInfo -Property WindowsProductId
```
Use `Get-Member` to see an object’s properties and methods
```powershell
Get-ComputerInfo | Get-Member
Get-Service -Name Spooler | Get-Member
```
Kill a process using an object method:
```powershell
$task = Get-Process notepad
$task.Kill()
```

# File Handling
```powershell
New-Item -Path 'C:\temp\test\Create File' -ItemType Directory
New-Item -Path 'C:\temp\test\test.html' -ItemType File
```

# ForEach
The point is that the dollar sign in `$_.` indicates that `$_.` is a variable. However, this is no ordinary variable. Instead, it is often referred to as a variable in the pipeline. In PowerShell, the word pipeline generally refers to a series of commands that have been joined together. Individual commands are separated from one another by using the pipe symbol (hence the name pipeline). When commands are joined together in a pipeline, the output from one command is used as input for the next command in the sequence

```powershell
Get-Process | Where-Object {$_.ProcessName -eq 'chrome'}
"Microsoft.PowerShell.Core", "Microsoft.PowerShell.Host" | ForEach-Object {$_.Split(".")}
```
