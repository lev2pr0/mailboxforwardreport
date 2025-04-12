#Function to pull forwarding report for UserMailbox and SharedMailbox
#Excludes empty objects for ForwardingSmtpAddress field
Function mailboxfwdreport {
    param(
        [string[]]$Domains=@(),
        [switch]$onpremEX,
        [string]$OutputPath = "mailboxfwdreport.csv" # Default output path
    )

    # Connect to Exchange Online and skips if -onpremEX switch is found
    if ($onpremEX -eq $false) {
        Write-Host "Connecting to Exchange Online..." -ForegroundColor Cyan
        try {
        $exchSessions = (Get-ConnectionInformation | Where-Object {$_.name -like "*ExchangeOnline*"})
        if ($exchSessions.count -lt 1) {
            Connect-ExchangeOnline
        } else {
            Write-Host "Already connected to Exchange Online." -ForegroundColor Green
        }
        } catch {
            Write-Host "Error connecting to Exchange Online: $_" -ForegroundColor Red
            Write-Host "If using on-premise Exchange, then rerun using -onPremEX switch" -ForegroundColor Red
            return
                }
    } else {
        Write-Host "Skipping Exchange Online connection as -onPremEX is provided." -ForegroundColor Cyan
    }

    # Gather domains to consider internal for report
    if (($Domains.count -lt 1) -or ($Domains[0].length -lt 1)) {    
    $Domains = ((Read-host "Type in a comma-separated list of your email domains, IE domain1.com,domain2.com") -replace ('@|"| ','')) -split ","
    
    # Validate domains
    $Domains = $Domains | Where-Object { $_ -match '^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' }
    if ($Domains.count -lt 1) {
        Write-Host "No valid domains provided. Exiting." -ForegroundColor Red
        return
        }
    }
    
    # Get all user and shared mailboxes with forwardingSMTPaddress
    Write-Host "Gathering mailboxes with forwarding addresses..." -ForegroundColor Cyan
    try {
    $mailboxes = Get-Mailbox -ResultSize Unlimited | Where-Object {
        $_.RecipientTypeDetails -eq "UserMailbox" -or $_.RecipientTypeDetails -eq "SharedMailbox"
        } | Where-Object {$_.ForwardingSmtpAddress -ne $null}
    } catch {
        Write-Host "Error retrieving mailboxes: $_" -ForegroundColor Red
        return
    }

    # Search for mailboxes with forwarding addresses, compare to $domains, and create PS Object for report
    $results = @()
    $mailboxes | ForEach-Object {
        $forwardingaddress = $_.ForwardingSmtpAddress.ToString()
        $domainPart = ($forwardingaddress -split "@")[1]
        $isInternal = $Domains -contains $domainPart

        $results += [PSCustomObject]@{
            DisplayName             = $_.DisplayName
            PrimarySmtpAddress      = $_.PrimarySmtpAddress
            ForwardingSmtpAddress   = $_.ForwardingSmtpAddress
            DeliverToMailboxAndForward = $_.DeliverToMailboxAndForward
            InternalExternal        = if ($isInternal) { "Internal" } else { "External" }
        }
    }

    # Export results to CSV
    try {
        $results | Export-Csv -Path $OutputPath -NoTypeInformation
        Write-Host "Report exported to $OutputPath" -ForegroundColor Green
    } catch {
        Write-Host "Error exporting results to CSV: $_" -ForegroundColor Red
    }
}
