# Start of Settings 
# End of Settings

Import-Module "C:\Scripts\Functions\get-3parSpace.ps1"
$DiskTypes = New-Object System.Collections.ArrayList
$MyCollection4 =  New-Object System.Collections.ArrayList
$DiskTypes = @("FC","NL","SSD")

ForEach ($DiskType in $DiskTypes){
    $Space = Get-3parSpace -devtype $DiskType
    $TotalUsedMB = 0
    $Total = New-object PSObject
    $Total | Add-Member -Name "Device Type" -Value $Space."Device Type" -Membertype NoteProperty
    $Total | Add-Member -Name "Total Capacity (GB)" -Value ([math]::Round(($Space."Total Capacity (MB)" / 1024),2))  -Membertype NoteProperty
    $Total | Add-Member -Name "System Used (GB)" -Value ([math]::Round(($Space."System Used (MB)" / 1024),2))  -Membertype NoteProperty
    $Total | Add-Member -Name "Volumes Used (GB)" -Value ([math]::Round(($Space."Volumes Used (MB)" / 1024),2))  -Membertype NoteProperty
    $TotalUsedGB = [math]::Round((([int]$Space."System Used (MB)" + [int]$Space."Volumes Used (MB)") / 1024),2)
    $Total | Add-Member -Name "Total Used (GB)" -Value $TotalUsedGB -Membertype NoteProperty
    $Total | Add-Member -Name "Free Capacity (GB)" -Value ([math]::Round(($Space."Free Capacity (MB)" / 1024),2))  -Membertype NoteProperty
    $Percentage = [Math]::round((($TotalUsedGB / ($Space."Total Capacity (MB)" / 1024)) * 100),2)
    $Total | Add-Member -Name "Percent Used" -Value $Percentage -Membertype NoteProperty
    $MyCollection4 += $Total
}
$MyCollection4 | ft -AutoSize


$Title = "3Par physical Disk Usage"
$Header = "3Par physical Disk Usage"
$Comments = "Usage hy Device Type."
$Display = "Table"
$Author = "Markus Kraus"
$PluginVersion = 1.0
$PluginCategory = "vSphere"
