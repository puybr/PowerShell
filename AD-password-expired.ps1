Import-Module ActiveDirectory
### Get AD users $ conver to HTML
$body = Get-Aduser -filter * -Properties * | ? {$_.PasswordExpired -eq $True} | ConvertTo-Html -Property Name

### SMTP params ###
$SMTPConnection = @{
    From = 'user@domain.org'
    To = 'helpdesk@domain.org'
    SmtpServer = 'remote.domain.org'
    Port = 25
    Subject = '[AUTOMATION] Password Expired Report: '+ (Get-Date -Format "dd/MM/yyyy")
    Priority = 'High'
    Body = "<html>$body</html>"
}

# # # SEND # # #
Send-MailMessage @SMTPConnection -BodyAsHtml
