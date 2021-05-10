#!/usr/bin/env bash
# Tomado del enlace --> https://docs.docker.com/engine/install/ubuntu/
#
# Fecha: 2021-03-25
#
if [ "" == "${1}" ]; then
  USUARIO="${USER}"
else
  USUARIO="${1}"
fi
echo ${USUARIO}
sudo apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

echo "Adicionando el usuario [${USUARIO}] al grupo [docker]"
sudo usermod -aG docker ${USUARIO}



#docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


sudo apt-get install resolvconf
sudo chmod 777 /etc/resolvconf/resolv.conf.d/head
cat << EOF >> /etc/resolvconf/resolv.conf.d/head
nameserver 8.8.4.4
nameserver 8.8.8.8
EOF
sudo service resolvconf restart