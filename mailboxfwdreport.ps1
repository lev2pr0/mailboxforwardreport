## M365 Prerequisites to Run: Exchange Online PowerShell module and execution policy remotesigned/unrestricted
## M365 only: Install-Module ExchangeOnlineManagement -Force
## M365 only: Connect-ExchangeOnline

#Function to pull forwarding report for UserMailbox and SharedMailbox
#Excludes empty objects for ForwardingSmtpAddress

$forwardingReport = Get-Mailbox -ResultSize Unlimited | 
    Where-Object {$_.RecipientTypeDetails -eq "UserMailbox" -or $_.RecipientTypeDetails -eq "SharedMailbox"} |
    Where-object {$_.ForwardingSmtpAddress -ne $null} | 
    Select-Object DisplayName, PrimarySmtpAddress, ForwardingSmtpAddress, DeliverToMailboxAndForward

#Export report to CSV
#$forwardingReport | Export-Csv -Path "C:\Temp\ForwardingReport.csv" -NoTypeInformation
