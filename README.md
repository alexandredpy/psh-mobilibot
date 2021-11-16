# psh-mobilibot
PowerShell script to get Mobilijeune's quota

## Requirements :
```powershell
# Install the Posh-SSH module : 
Install-Module -Name PSSQlite
```
## To create a credential PS Object :
```powershell
$credential = Get-Credential -Message "Enter the router password" -Username admin
$credential | Export-CliXml -Path 'C:\Path\credential.xml'

## To import it and use it :
$credential = Import-CliXml -Path 'C:\Path\credential.xml'
```

#### To make a SQL Query
Modify the $routers array :
```powershell
$database = 'C:\Path\file.sqlite'
$query = 'your sql query'
Invoke-SQLiteQuery -DataSource $database -Query $query

#Example :
$query = "CREATE TABLE yourtable (hostname TEXT PRIMARY KEY, location TEXT)"
$query = "INSERT INTO yourtable (hostname, location) VALUES ('router1', 'lyon')"
```