# POWERSHELL
# eSecurity

# Script PowerShell para desabilitar o TLS 1.1

# Caminhos no registro onde as configurações do TLS 1.1 estão armazenadas
$registryPaths = @(
    "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server",
    "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client"
)

# Valor para desabilitar o TLS 1.1
$disabledValue = 0  # 0 significa desabilitado

# Processa cada caminho de registro para desabilitar o TLS 1.1
foreach ($path in $registryPaths) {
    # Verifica se o caminho do registro existe e cria se não existir
    if (-not (Test-Path $path)) {
        Write-Host "Criando caminho do registro: $path"
        New-Item -Path $path -Force | Out-Null
    }

    # Define a chave 'Enabled' para 0 para desabilitar o TLS 1.1
    Write-Host "Desabilitando TLS 1.1 em: $path"
    Set-ItemProperty -Path $path -Name "Enabled" -Value $disabledValue
}

Write-Host "TLS 1.1 foi desabilitado."

# Como usar este script:
# 1. Abra o PowerShell como Administrador.
# 2. Copie e cole este script no PowerShell e pressione Enter para executar.
# 3. O script irá verificar e alterar as configurações do registro para desabilitar o TLS 1.1.
# 4. Uma reinicialização do sistema pode ser necessária para que as configurações tenham efeito.

