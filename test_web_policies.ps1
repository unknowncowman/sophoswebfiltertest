# Last update @17/05/2022 github.com/unknowncowman
# 
# This script sends webrequests to a list of websites and writes an 
# info of text into a result file if the request runs into an error

# adds the current date
$date = Get-Date -Format "`r`ndddd dd.MM.yyyy HH:mm:ss `r`n"
$date | Out-File -FilePath $PSScriptRoot\Blockierte_Webseiten.txt

# adds a link to the Sophos-Test website
$sophostest = "Aufschlüsselung unter http://sophostest.com/`r`n"
$sophostest | Out-File -Append -FilePath $PSScriptRoot\Blockierte_Webseiten.txt

# iterates a file that contains links
foreach($line in [System.IO.File]::ReadLines("$PSScriptRoot\testwebsites.txt")) 
{
    # sends webrequests to the link in $line
    $WebResponse = Invoke-WebRequest $line 
    
    # checks if $WebResponse above ran without errors. Makes an output if it ran into an error.
    if($?)
    {
      
    }
    #pipes a message into a file if an error occured in $WebResponse
    else
    {
    "nicht erreichbar - " + $line | Out-File -Append -FilePath $PSScriptRoot\Blockierte_Webseiten.txt
    }
}