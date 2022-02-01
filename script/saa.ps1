Function Set-AzureAccount {
[CmdletBinding()]

$accounts = az account list | ConvertFrom-Json

for ($i=0 ; $i -lt $accounts.Length ; $i++){
    $active = ""
    if($accounts[$i].isDefault -eq $True){
        $active = "==> ACTIVE <=="
    }
    Write-Host "` -$($i)-   $($accounts[$i].name) $active"
}

Write-Host "` "

[uint16]$target= Read-Host -Prompt "Select your Subscription"
az account set --subscription $accounts[$target].id
}

Set-AzureAccount