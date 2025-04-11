# Mailbox Forward Report

This script is designed to automate the process of generating a report for forwarding addresses on user/shared mailboxes

## PARAMETER 

~WIP

## EXAMPLES

### Export report to CSV
```powershell
$forwardingReport | Export-Csv -Path "c:\temp\forwardingreport.csv" -NoTypeInformation
```

## NOTES

### M365 Prerequisites to Run: 


Install Exchange Online Powershell module
```powershell
Install-Module ExchangeOnlineManagement -Force
```


Connect to Exchange Online
```powershell
Connect-ExchangeOnline
```


## Contributing

~WIP

## License

[MIT License](https://choosealicense.com/licenses/mit/)
