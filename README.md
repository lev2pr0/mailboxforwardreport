**Archived Note:** Combined function in [Public Distribution Group and Mailbox Forward Report](https://github.com/lev2pr0/DLMailboxForwardingReport) 

# Mailbox Forward Report
## Purpose 

In the face of escalating insider threats, the reporting of data breaches has become paramount for safeguarding organizational integrity. The most prevalent threat originates from employees misusing their access privileges for data exfiltration, often driven by personal gain. 
<br></br>
To address these challenges at the mailbox level, this script is designed to automate the generation of a report on configured forwarding SMTP addresses for user or shared mailboxes.
<br></br>
For further reporting capabilities, refer to the [Public Distribution List](https://github.com/lev2pr0/publicDLreport) reporting feature, which allows security professionals to retrieve reports of all Distribution Lists open to external senders, enabling them to send mail to both internal and external recipients. 

<br></br>
## Installation

1. Download or make copy of script [here](https://github.com/lev2pr0/mailboxforwardreport/blob/main/mailboxfwdreport.ps1)
2. Take note of the script’s path
3. Open PowerShell as an administrator
4. Use ```Set-ExecutionPolicy -ExecutionPolicy <VALUE> -Scope <VALUE>``` to change to acceptable [Execution Policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.5#-executionpolicy)
5. **Optional:** Navigate to directory location of script using ```cd``` command (Example: ```cd “C:\MyFolder”```)
6. Run PowerShell Script ```.\<scriptname>.ps1``` or ```C:\MyFolder\<scriptname>.ps1```

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
Specifies the email domains to be used for filtering external members. This parameter accepts a comma-separated list of domains. If not provided, the script will end. 

---

```powershell
-onpremEX
```
Skips the connection to Exchange Online sessions entirely for Exchange Management Shell. Use this switch if you want to use for Exchange On-Premise.

<br></br>
## Usage Examples

### Run the function to generate a Mailbox Forward report for Exchange Online examples
```powershell
mailboxfwdreport -Domains "domain1.com,domain2.com" -OutputPath "C:\Reports"
```
```powershell
mailboxfwdreport -Domains "domain1.com,domain2.com"
```

---

### Run the function to generate a Mailbox Forward report for Exchange On-Premise examples
```powershell
mailboxfwdreport -Domains "domain1.com,domain2.com" -OutputPath "C:\Reports" -onpremEX 
```
```powershell
mailboxfwdreport -Domains "domain1.com,domain2.com" -onpremEX
```

<br></br>
## Demo

### Report in directory
![Screenshot_CSVinDirectory](https://github.com/user-attachments/assets/df015eb1-14cd-465b-a9b3-8dbf36393279)

**Important Note:** CSV report will show as *MailboxFWDReport_yyyyMMdd_HHmmss.csv* in current directory of terminal if ```-OutputPath``` not specified.

#

### CSV Report in Microsoft Excel
![Screenshot_CSVinExcel](https://github.com/user-attachments/assets/7465e627-548d-42f3-8f0e-88a3211a795e)

<br></br>
## NOTES

### Supported Versions

-- Exchange Online PowerShell V2 module, version 2.0.4 or later

-- Powershell 7 or later

-- Exchange Server 2013, 2016, and 2019

#

### Exchange Online Prerequisites to Run: 

Install Exchange Online Powershell module
```powershell
Install-Module ExchangeOnlineManagement -Force
```
**Please Note:** This will require restart of terminal after install. Only use for first time accessing Exchange Online via Powershell on local machine.

#

### Disclaimers
-- Always test the script in a non-production environment first.


-- Review the script's code and understand its functionality before execution.


-- The script may require specific permissions or elevated privileges to run correctly.


-- The script's behavior may vary depending on the system configuration and environment.

<br></br>
## Contributing

Open to all collaboration 🙏🏽

Please follow best practice outlined below:

1. Fork from the ```main``` branch only
2. Once forked, make branch from ```main``` with relevant topic
3. Make commits to improve project on branch with detailed notes
4. Test, test, test and verify
5. Push branch to ```main``` in your Github project
6. Test, test, test and verify
7. Open pull request to ```main``` with details of changes (screenshots if applicable)

Once steps complete, I will engage to discuss changes if required and evaluate readiness for merge. Cases where pull requests are closed, I will provide detailed notes on the why and provide direction for your next pull request.

</br>

<p align="center" 
 
 **How to support?** Buy me coffee ☕️ via [Paypal](https://www.paypal.com/donate/?business=E7G9HLW2WPV22&no_recurring=1&item_name=Empowering+all+to+achieve+success+through+technology.%0A&currency_code=USD)

</p>

## License

[MIT License](https://choosealicense.com/licenses/mit/)
