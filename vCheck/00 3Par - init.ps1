# Start of Settings 
# 3Par Array Name or IP
$3ParArray = "myArray"
# 3Par Array UserName
$3ParUser = "3paradm"
# 3Par Array UserPassword
$3ParPassword = "Passw0rd!"
# End of Settings

$SANConnection = New-SANConnection -SANIPAddress $3ParArray -SANUserName $3ParUser -SANPassword $3ParPassword

If (($SANConnection).GetType().Name -ne "_SANConnection"){
    Write-Error "SANConnError - Unable to Connect to 3PAR System"
    }
    

$Title = "3Par Enviroment Init"
$Header = "3Par Enviroment Init"
$Comments = "3Par Enviroment Init"
$Display = "Table"
$Author = "Markus Kraus"
$PluginVersion = 1.2
$PluginCategory = "vSphere"
