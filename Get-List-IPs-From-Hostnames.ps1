$servers = Get-Content -path "C:\Scripts\Test\servers.txt"

$obj = New-Object -TypeName psobject

foreach ($server in $servers) {

$IPaddress = (Test-NetConnection -ComputerName $server).RemoteAddress.IPAddressToString

$obj = New-Object PSObject -Property @{
    Server = $server
    IP_Address = $IPaddress
}
   
$obj | Select-Object server, IP_Address
$obj | Select-Object server, IP_Address | export-CSV 'C:\Temp\IpAddresses.csv' -Append

}