#!/bin/bash
# eSecurity
# Caminho para o arquivo de configuração do SSH
SSH_CONFIG="/etc/ssh/sshd_config"

echo "Configurando o servidor SSH para não exibir a versão..."

# Fazendo backup do arquivo de configuração original
sudo cp $SSH_CONFIG "${SSH_CONFIG}.backup"

# Verificando se a configuração 'DebianBanner' já existe
if grep -q "^DebianBanner" $SSH_CONFIG; then
    # Substituindo a configuração existente para não exibir a versão
    sudo sed -i 's/^DebianBanner.*/DebianBanner no/' $SSH_CONFIG
else
    # Adicionando a configuração para não exibir a versão
    echo "DebianBanner no" | sudo tee -a $SSH_CONFIG > /dev/null
fi

# Reiniciando o serviço SSH para aplicar as mudanças
sudo systemctl restart ssh

echo "A configuração foi atualizada. O banner com a versão do SSH foi removido."
