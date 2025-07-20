#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
set -e

echo "➡️ System update is starting..."
apt-get update -y && apt-get install -y curl git

echo "➡️ Dev Tools installation begins..."

install_node() {
    if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
        echo "➡️ Installing Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
        apt-get install -y nodejs git
        echo "✅ Node.js has been successfully installed."
    else
        echo "✅ Node.js is already installed."
    fi
}

install_node

# 2. Встановлення Docker (якщо відсутній)
if ! command -v docker &> /dev/null; then
    echo "➡️ Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    echo "✅ Docker has been successfully installed."
else
    echo "✅ Docker is already installed."
fi

# 3. Встановлення Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "➡️ Installing Docker Compose..."
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
        -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo "✅ Docker Compose уhas been successfully installed."
else
    echo "✅ Docker Compose is already installed."
fi

# 4. Встановлення Python 3.9+
if ! command -v python3.9 &>/dev/null; then
    echo "➡️ Installing Python 3.9..."
    apt install -y software-properties-common
    add-apt-repository -y ppa:deadsnakes/ppa
    apt update
    apt install -y python3.9 python3.9-venv python3.9-dev python3-pip
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
    echo "✅ Python 3.9 has been successfully installed."
else
    echo "✅ Python 3.9+ is already installed."
fi

# 5. Встановлення Django
if ! python3 -m django --version &> /dev/null; then
    echo "➡️ Installing Django..."
    pip3 install Django
    echo "✅ Django has been successfully installed."
else
    echo "✅ Django is already installed."
fi

echo "🎉 All tools installed!"