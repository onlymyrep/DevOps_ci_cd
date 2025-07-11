#!/bin/bash
set -ex

# Параметры подключения
DEPLOY_USER="bartonjo"
DEPLOY_IP="10.0.2.15"
PROJECT_DIR="code-samples"

echo "🔑 Setting up SSH access..."
mkdir -p ~/.ssh

# Используем ключ из домашней директории gitlab-runner
cp /home/gitlab-runner/gitlab_deploy_key ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

# Добавляем хост в known_hosts
ssh-keyscan -H $DEPLOY_IP >> ~/.ssh/known_hosts

echo "🔍 Testing SSH connection..."
ssh -o StrictHostKeyChecking=no -T $DEPLOY_USER@$DEPLOY_IP "echo 'SSH connection successful!'" || true

echo "🚚 Deploying DO to $DEPLOY_USER@$DEPLOY_IP..."
scp -o StrictHostKeyChecking=no \
    "$CI_PROJECT_DIR/$PROJECT_DIR/DO" \
    $DEPLOY_USER@$DEPLOY_IP:/tmp/DO

echo "🚚 Moving DO to /usr/local/bin..."
ssh -o StrictHostKeyChecking=no $DEPLOY_USER@$DEPLOY_IP \
    "sudo mv /tmp/DO /usr/local/bin/ && \
     sudo chmod +x /usr/local/bin/DO && \
     echo '✅ Successfully deployed DO'"

echo "🔍 Verifying installation..."
ssh $DEPLOY_USER@$DEPLOY_IP "DO 6"

echo "🎉 Deployment completed successfully!"