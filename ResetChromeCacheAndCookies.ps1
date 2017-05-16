#Get Username
dir C:\Users | select Name | Export-Csv -Path C:\users\$env:USERNAME\users.csv -NoTypeInformation
$list=Test-Path C:\users\$env:USERNAME\users.csv

#Save Paths in folders variables and delete files in them
if ($list) {
    Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
        $folders = @("C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*",
        "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*", 
        "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies", 
        "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache", 
        "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal")
        Remove-Item $folders -Recurse -Force -EA SilentlyContinue -Verbose
    }
}
else{
    Exit
}