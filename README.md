# Mailbox Forward Report
## Purpose 

Microsoft’s current reporting on forwarding within organizations is reactive in nature. This reactive approach can lead to missed insider threats if not reported promptly. Additionally, manually creating reports via PowerShell can be time-consuming for security professionals.
<br></br>
To address these challenges, this script is designed to automate the process of generating a report on configured forwarding SMTP addresses on user or shared mailboxes.
<br></br>
For further reporting capabilities, refer to the [Public Distribution List](https://github.com/lev2pr0/publicDLreport) reporting feature, which allows security professionals to retrieve reports of all Distribution Lists open to external senders, enabling them to send mail to both internal and external recipients. 
<br></br>

<p align="center" 
 
 **Support?** Buy me coffee ☕️ via [Paypal](https://www.paypal.com/donate/?business=E7G9HLW2WPV22&no_recurring=1&item_name=Empowering+all+to+achieve+success+through+technology.%0A&currency_code=USD)

</p>

## Installation

<img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExOGlmcmhqeWZkejFnZHV3MnU2MTIxYjczNW9ldTJmdm1leDdsaXR4YyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vR1dPIYzQmkRzLZk2w/giphy.gif" width="200" height="200" />

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
## Screenshot of report imported in Excel

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

Open to all collaboration 🙏🏽

Please follow best practice outlined below:

1. Fork from the ```main``` branch only
2. Once forked, make branch from ```main``` with relevant topic
3. Make commits to improve project on branch with detailed notes
4. Test, test, test and verify
5. Push branch to ```main``` in your Github project
6. Test, test, test and verify
7. Open pull request to ```main``` with details of changes (screenshots if applicable)

Once steps complete, I will engage to discuss changes if required and evaluate readiness for merge. Cases where pull requests are closed I will provide detailed notes on the why and provide direction for your next pull request. 

<br></br>
## License

[MIT License](https://choosealicense.com/licenses/mit/)
