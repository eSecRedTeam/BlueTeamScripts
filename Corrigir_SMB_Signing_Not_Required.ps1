#POWERSHELL
#eSecurity

# Define o nome do registro e o caminho que contém as configurações do SMB
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"

# As chaves do Registro que controlam o SMB Signing
$serverSigningKey = "RequireSecuritySignature"
$clientSigningKey = "EnableSecuritySignature"

# Valor para ativar o SMB Signing
$enabledValue = 1

# Verifica e define a configuração do servidor SMB
if ((Get-ItemProperty -Path $registryPath).$serverSigningKey -ne $enabledValue) {
    Write-Host "Configurando SMB Signing no servidor para obrigatório..."
    Set-ItemProperty -Path $registryPath -Name $serverSigningKey -Value $enabledValue
} else {
    Write-Host "SMB Signing já está configurado como obrigatório no servidor."
}

# Verifica e define a configuração do cliente SMB
if ((Get-ItemProperty -Path $registryPath).$clientSigningKey -ne $enabledValue) {
    Write-Host "Configurando SMB Signing no cliente para obrigatório..."
    Set-ItemProperty -Path $registryPath -Name $clientSigningKey -Value $enabledValue
} else {
    Write-Host "SMB Signing já está configurado como obrigatório no cliente."
}

Write-Host "Configuração do SMB Signing atualizada."
