# MobiliBot - PowerShell
# Author : Alexandre DPY (https://github.com/alexandredpy)$
# License : CC-BY-NC-SA
# Thanks to : https://github.com/LeoGeneret/MobiliBot

# Presets
Import-Module SimplySql
$URL = 'https://mobilijeune.actionlogement.fr/api/dossiers/1.0/checkDailyQuota'

$request = Invoke-WebRequest -Uri $URL # Current state
$return = $request.Content # Get only the content value (false or true)

# If false then 0, if true then 1, else -1
# YES, this isn't optimized
if ($return -eq 'false') 
{
    [int]$resultcode = 0
}
if ($return -eq 'true') 
{
    [int]$resultcode = 1    
}
if ($return -ne 'true' -and $return -ne 'true') 
{
    [int]$resultcode = -1   
}

# Connect to database
Open-MySqlConnection -Server '127.0.0.1' -UserName 'mobilibot' -Password 'mobilibot' -Port '3306' -Database 'mobilibot' -SSLMode None

# Insert into DB
$query = "INSERT INTO mobilitable (resultcode) VALUES ('$resultcode')"
Invoke-SqlUpdate -Query $query

# Close SQL Connection
Close-SqlConnection 

