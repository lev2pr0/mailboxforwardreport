#Function to pull forwarding report for UserMailbox and SharedMailbox
#Excludes empty objects for ForwardingSmtpAddress

$forwardingReport = Get-Mailbox -ResultSize Unlimited | 
    Where-Object {$_.RecipientTypeDetails -eq "UserMailbox" -or $_.RecipientTypeDetails -eq "SharedMailbox"} |
    Where-object {$_.ForwardingSmtpAddress -ne $null} | 
    Select-Object DisplayName, PrimarySmtpAddress, ForwardingSmtpAddress, DeliverToMailboxAndForward
