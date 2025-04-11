# mailboxforwardreport

This script is designed to automate the process of generating a report for forwarding addresses on user/shared mailboxes

## PARAMETER 

~WIP

## EXAMPLES

# Export report to CSV
$forwardingReport | Export-Csv -Path "c:\temp\forwardingreport.csv" -NoTypeInformation

## NOTES

# M365 Prerequisites to Run: 


Install Exchange Online Powershell module
```powershell Install-Module ExchangeOnlineManagement -Force``


Connect to Exchange Online
```powershell Connect-ExchangeOnline```


Author: Levar Norwood
Date: 2025-04-02
Version: 2.0

## Contributing

~WIP

## License

[MIT License](https://choosealicense.com/licenses/mit/)
