#Save all the file paths in tempfolders variable
$tempfolders = @( "C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")

#Remove the files inside the folders
Remove-Item $tempfolders -force -recurse