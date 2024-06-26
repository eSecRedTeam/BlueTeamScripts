#POWERSHELL
#eSecurity

# Script PowerShell para ativar a Network Level Authentication (NLA) para os Serviços de Terminal

# O caminho no registro onde a configuração do Remote Desktop é armazenada
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"

# A chave do Registro para NLA
$securityLayerKey = "SecurityLayer"
$securityLayerValue = 1  # 1 representa RDP Security Layer que requer NLA

$userAuthenticationKey = "UserAuthentication"
$userAuthenticationValue = 1  # 1 significa que a NLA está ativada

# Verifica e ativa a NLA para os Serviços de Terminal
try {
    # Configura o Security Layer para requerer NLA
    if ((Get-ItemProperty -Path $registryPath).$securityLayerKey -ne $securityLayerValue) {
        Write-Host "Configurando Security Layer para requerer NLA..."
        Set-ItemProperty -Path $registryPath -Name $securityLayerKey -Value $securityLayerValue
    } else {
        Write-Host "Security Layer já está configurado para requerer NLA."
    }

    # Ativa a UserAuthentication para forçar o uso de NLA
    if ((Get-ItemProperty -Path $registryPath).$userAuthenticationKey -ne $userAuthenticationValue) {
        Write-Host "Ativando User Authentication para forçar o uso de NLA..."
        Set-ItemProperty -Path $registryPath -Name $userAuthenticationKey -Value $userAuthenticationValue
    } else {
        Write-Host "User Authentication já está ativada para usar NLA."
    }

    Write-Host "NLA foi ativada com sucesso para os Serviços de Terminal."
} catch {
    Write-Host "Ocorreu um erro ao tentar configurar NLA para os Serviços de Terminal: $_"
}

# Como usar este script:
# 1. Abra o PowerShell como Administrador.
# 2. Copie e cole este script no PowerShell e pressione Enter.
# 3. O script verificará a configuração atual e fará as alterações necessárias para ativar a NLA.
# 4. Reinicie o serviço de Remote Desktop ou o computador para aplicar as mudanças.

