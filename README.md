# Mailbox Forward Report

This script is designed to automate the process of generating a report for forwarding addresses on user/shared mailboxes

## Installation

### Local path run of script
```powershell
./mailboxfwdreport.ps1
```

<br></br>
## Parameters 

```powershell
-OutputPath
```
Allows the user to specify the location of the exported CSV file.

---

```powershell
-Domains
```
Specifies the email domains to be used for filtering external members. This parameter accepts a comma-separated list of domains. If not provided, the script will prompt for input.

---

```powershell
-onpremEX
```
Skips the connection to Exchange Online sessions entirely for Exchange Management Shell. Use this switch if you want to use for Exchange On-Premise.

<br></br>
## Usage Examples

<img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExOGlmcmhqeWZkejFnZHV3MnU2MTIxYjczNW9ldTJmdm1leDdsaXR4YyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vR1dPIYzQmkRzLZk2w/giphy.gif" width="200" height="200" />

<br></br>
## NOTES

### Exchange Online Prerequisites to Run: 


Install Exchange Online Powershell module
```powershell
Install-Module ExchangeOnlineManagement -Force
```
**Please Note:** Only use for first time accessing Exchange Online via Powershell on local machine

<br></br>
### Warning
-- Always test the script in a non-production environment first.


-- Review the script's code and understand its functionality before execution.


-- The script may require specific permissions or elevated privileges to run correctly.


-- The script's behavior may vary depending on the system configuration and environment.

<br></br>
## Contributing

<img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExOGlmcmhqeWZkejFnZHV3MnU2MTIxYjczNW9ldTJmdm1leDdsaXR4YyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vR1dPIYzQmkRzLZk2w/giphy.gif" width="200" height="200" />

<br></br>
## License

[MIT License](https://choosealicense.com/licenses/mit/)
