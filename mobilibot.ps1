# COPYRIGHT ALEXANDRE DUPOUY
# MOBILIBOT - POWERSHELL 
# Based on https://github.com/LeoGeneret/MobiliBot

#Presets
$URL = 'https://mobilijeune.actionlogement.fr/api/dossiers/1.0/checkDailyQuota'
$timestamp = Get-Date -DisplayHint Time
$mailcreds = Import-CliXml -Path 'C:\Users\Administrateur\Documents\mail-creds.xml'

$request = Invoke-WebRequest -Uri $URL # Current state
$return = $request.Content # Get only the content value

#Timestamp it
Write-Output "$timestamp | $return" >> .\Mobilibot.txt
Write-Output $return >> .\last-state.txt

#Get the last line
$lastline = Get-Content -Tail 1  -Path .\last-state.txt

#If current state is different from last state
#Then alert me by email
if ($request -ne $lastline ) 
{
    Send-MailMessage -From 'MobiliBot - ADU <services@alexandredupouy.fr>' -To 'alexandre@dupouy.ovh' -Subject "MOBILIBOT - State is $request" -SmtpServer "node-email-1.pulsepanel.eu" -UseSsl -Port 587 -Credential $mailcreds -Body "Current state : $request -- $timestamp"
}


