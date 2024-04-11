#!/bin/bash
# eSecurity BlueTeam
# Definindo a versão do OpenSSH para instalação
OPENSSH_VERSION="9.7p1"  # Substitua isso pela versão desejada

# Instalando dependências necessárias para compilação
sudo apt-get update
sudo apt-get install -y build-essential zlib1g-dev libssl-dev libpam0g-dev

# Baixando o código fonte do OpenSSH
wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${OPENSSH_VERSION}.tar.gz

# Descompactando o arquivo
tar -zxvf openssh-${OPENSSH_VERSION}.tar.gz
cd openssh-${OPENSSH_VERSION}

# Configurando a compilação do OpenSSH
./configure --prefix=/usr --sysconfdir=/etc/ssh --with-privsep-path=/var/lib/sshd --with-pam

# Compilando e instalando o OpenSSH
make
sudo make install

# Reiniciando o serviço SSH
sudo systemctl restart ssh

# Atualiza os keygens
cd /etc/ssh
ssh-keygen -A

echo "OpenSSH ${OPENSSH_VERSION} foi instalado com sucesso."
