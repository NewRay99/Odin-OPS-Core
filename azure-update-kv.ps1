

$Environment=$args[0]
$resourceGroupLocation=$args[1]
$kvName=$args[2]
$overwrite=$args[3]1

$json = Get-Content -Raw $buildSourcesDirectory +'/DatabricksBuild/kv.json';

$jsonparsed = convertFrom-Json $json -ErrorAction Stop;

ForEach ($p in $jsonparsed.psobject.properties.name) {
    Write-Host '***********'
    Write-Host 'key' $p
    Write-Host 'type' $jsonparsed.$p.type
    Write-Host 'sv' $jsonparsed.$p.Env.$Environment
    $kvScrtName = $p
    $kvType = $jsonparsed.$p.type
    $kvScrtV = $jsonparsed.$p.Env.$Environment
    if (kvType -eq password)
    {
    $secretvalue = ConvertTo-SecureString $kvScrtV -AsPlainText -Force
    }
    else{
    $secretvalue = $kvScrtV
    }
    if ($Environment -eq 1)
    {
    $secret = Set-AzKeyVaultSecret -VaultName $kvName -ContentType $kvType -Name $kvScrtName -SecretValue $secretValue
    }
}