# COPYRIGHT ALEXANDRE DUPOUY
# MOBILIBOT - POWERSHELL 
# Idea created with base of https://github.com/LeoGeneret/MobiliBot

# Presets
Import-Module SimplySql
$URL = 'https://mobilijeune.actionlogement.fr/api/dossiers/1.0/checkDailyQuota'

$request = Invoke-WebRequest -Uri $URL # Current state
$return = $request.Content # Get only the content value (false or true)

# If false then 0, else 1
if ($return = 'false') 
{
    [int]$resultcode = 0
}
else 
{
    [int]$resultcode = 1    
}

# Connect to database
Open-MySqlConnection -Server '127.0.0.1' -UserName 'mobilibot' -Password 'mobilibot' -Port '3306' -Database 'mobilibot' -SSLMode None

# Insert into DB
$query = "INSERT INTO mobilitable (resultcode) VALUES ('$resultcode')"
Invoke-SqlUpdate -Query $query

# Close SQL Connection
Close-SqlConnection 

