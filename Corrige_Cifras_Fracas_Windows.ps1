#POWERSHELL
#eSecurity

# Cifras que serão desabilitadas
$weakCiphers = @("TLS_RSA_WITH_3DES_EDE_CBC_SHA", "SSL_CK_DES_192_EDE3_CBC_WITH_MD5")

# Registro path
$schannelPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\"

# Desabilita as cifras fracas
foreach ($cipher in $weakCiphers) {
    $cipherPath = $schannelPath + $cipher
    Write-Host "Desabilitando a cifra: $cipher"
    
    # Verifica se o caminho da cifra já existe, caso contrário, cria
    if (-Not (Test-Path $cipherPath)) {
        New-Item -Path $cipherPath -Force
    }
    
    # Define o valor 'Enabled' como 0 para desabilitar a cifra
    Set-ItemProperty -Path $cipherPath -Name "Enabled" -Value 0
}

Write-Host "As cifras fracas foram desabilitadas."
