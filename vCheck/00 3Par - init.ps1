# Start of Settings 
# 3Par Array Name or IP
$3ParArray = "myArray"
# 3Par Array UserName
$3ParUser = "3paradm"
# 3Par Array UserPassword
$3ParPassword = "Passw0rd!"
# End of Settings

$trash = New-SANConnection -SANIPAddress $3ParArray -SANUserName $3ParUser -SANPassword $3ParPassword

$Title = "3Par Enviroment Init"
$Header = "3Par Enviroment Init"
$Comments = "3Par Enviroment Init"
$Display = "Table"
$Author = "Markus Kraus"
$PluginVersion = 1.1
$PluginCategory = "vSphere"
