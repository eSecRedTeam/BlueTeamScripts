#!/bin/bash
# eSecurity
# Caminho para o arquivo de configuração do Apache
# Este caminho pode variar dependendo da instalação do Apache
apacheConfig="/etc/apache2/apache2.conf"

# Verifica se o arquivo de configuração do Apache existe
if [ -f "$apacheConfig" ]; then
    # Desabilita o banner do servidor
    echo "Editando o arquivo de configuração do Apache para desativar o banner do servidor..."

    # Assegura que 'ServerTokens Prod' esteja no arquivo de configuração
    if ! grep -q "ServerTokens Prod" "$apacheConfig"; then
        echo "ServerTokens Prod" >> "$apacheConfig"
    else
        sed -i 's/^ServerTokens .*/ServerTokens Prod/' "$apacheConfig"
    fi

    # Assegura que 'ServerSignature Off' esteja no arquivo de configuração
    if ! grep -q "ServerSignature Off" "$apacheConfig"; then
        echo "ServerSignature Off" >> "$apacheConfig"
    else
        sed -i 's/^ServerSignature .*/ServerSignature Off/' "$apacheConfig"
    fi

    # Reinicia o serviço Apache para aplicar as mudanças
    echo "Reiniciando o Apache para aplicar as mudanças..."
    systemctl restart apache2
    echo "O banner do Apache foi desativado com sucesso."
else
    echo "O arquivo de configuração do Apache não foi encontrado em $apacheConfig."
fi
