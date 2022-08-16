# WinRM must be enabled on clients.
# winrm qc
#
#
#

$ips = '192.168.1.120','192.168.1.150';
Write-Output $ips;

$script = {
    $output = winget --upgrade --all --accept-source-agreements  --accept-package-agreements
    New-Object -TypeName PSCustomObject -Property @{Host=$env:computername; Output=$output}
}


foreach ($ip in $ips) {
    $remoteSession = New-PSSession -ComputerName $ip -Credential \jan.pilar
    $results = Invoke-Command -Session $remoteSession -ScriptBlock $script

}