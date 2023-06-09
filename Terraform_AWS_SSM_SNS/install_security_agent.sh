#!/bin/bash
# Security Agent Simulation - Install

echo "Downloading security agent..."
sudo wget -q https://raw.githubusercontent.com/slaceved2/Articles/main/Terraform_AWS_SSM_SNS/security_agent --backups=0 -P /usr/bin
echo "Security agent installation in progress..."
sudo chmod +x /usr/bin/security_agent
sleep 30
echo "Security agent installation completed."
sudo /usr/bin/security_agent status
