#README.md(https://github.com/lev2pr0/mailboxforwardreport/blob/main/README.md)
#Function to pull forwarding report for User and Shared Mailbox
#Excludes empty objects for ForwardingSMTPAddress field
Function mailboxfwdreport {
    param(
        [string[]]$Domains=@(),
        [switch]$onpremEX,
        [string]$OutputPath = "MailboxFWDReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv" # Default output path
    )

    # Connect to Exchange Online and skips if -onpremEX switch is found
    if (-not $onpremEX) {
        Write-Host "Connecting to Exchange Online..." -ForegroundColor Cyan
        try { # Check for existing Exchange Online sessions
        $exchSessions = (Get-ConnectionInformation | Where-Object {$_.name -like "*ExchangeOnline*"})
        if ($exchSessions.count -lt 1) { # Connect to Exchange Online if no existing session
            Connect-ExchangeOnline
        } else { # Confirm existing connection to Exchange Online
            Write-Host "Already connected to Exchange Online." -ForegroundColor Green
        }
        } catch { # Handle errors connecting to Exchange Online
            Write-Host "Error connecting to Exchange Online: $_" -ForegroundColor Red
            Write-Host "If using Exchange Management Shell on Exchange Server, then rerun using -onPremEX switch" -ForegroundColor Red
            Write-Host "Exiting script." -ForegroundColor Red
            return
                }
    } else { # Skip Exchange Online session check and connection
        Write-Host "Skipping Exchange Online connection as -onPremEX is provided." -ForegroundColor Cyan
    }

    # Gather domains to consider internal for report
    if (($Domains.count -lt 1) -or ($Domains[0].length -lt 1)) {    
    $Domains = ((Read-host "Type in a comma-separated list of your email domains, IE domain1.com,domain2.com") -replace ('@|"| ','')) -split ","
    
    # Validate domains
    $Domains = $Domains | Where-Object { $_ -match '^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' }
    if ($Domains.count -lt 1) { # Handle errors for invalid user inputs
        Write-Host "No valid domains provided." -ForegroundColor Red
        Write-Host "Please provide a valid domain list in the format: domain1.com,domain2.com" -ForegroundColor Red
        Write-Host "Exiting script." -ForegroundColor Red
        return
        }
    }
    
    # Get all user and shared mailboxes with forwardingSMTPaddress
    Write-Host "Gathering mailboxes with forwarding addresses..." -ForegroundColor Cyan
    try { 
    $mailboxes = Get-Mailbox -ResultSize Unlimited | Where-Object {
        $_.RecipientTypeDetails -eq "UserMailbox" -or $_.RecipientTypeDetails -eq "SharedMailbox"
        } | Where-Object {$_.ForwardingSmtpAddress -ne $null}
    } catch { # Handle errors for each mailbox
        Write-Host "Error retrieving mailboxes: $_" -ForegroundColor Red
        return
    }

    # Search for mailboxes with forwarding addresses configured
    # Split domains to compare if Internal or External
    $results = @()
    $mailboxes | ForEach-Object {
        $forwardingaddress = $_.ForwardingSmtpAddress.ToString()
        $domainPart = ($forwardingaddress -split "@")[1]
        $isInternal = $Domains -contains $domainPart
        # Build report of mailboxes with forwardingSMTPaddress configured
        $results += [PSCustomObject]@{
            DisplayName             = $_.DisplayName
            PrimarySmtpAddress      = $_.PrimarySmtpAddress
            ForwardingSmtpAddress   =  if ($_.ForwardingSmtpAddress -match ":") { ($forwardingaddress -split ":")[1] } else { $_.ForwardingSmtpAddress }
            DeliverToMailboxAndForward = $_.DeliverToMailboxAndForward
            Organization        = if ($isInternal) { "Internal" } else { "External" }
        }
    }

    # Export results to CSV
    if ($results.Count -gt 0) {
        try {
            $results | Export-Csv -Path $OutputPath -NoTypeInformation
            Write-Host "Report exported to $OutputPath" -ForegroundColor Green
        } catch {
            Write-Host "Error exporting results to CSV: $_" -ForegroundColor Red
        }
    } else {
        Write-Host "No results to export." -ForegroundColor Yellow
    }
}
