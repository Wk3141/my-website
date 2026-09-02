#!/bin/bash

# ============================================
# DEPLOYMENT SCRIPT FOR AWS ECR + DOCKER
# ============================================

# Your AWS Account ID (from EC2 Dashboard)
AWS_ACCOUNT_ID="992282472152"        # ✅ From your screenshot
AWS_REGION="us-east-1"               # Your AWS region
ECR_REPOSITORY="my-website-repo"     # Your ECR repository name

echo "🔨 Building Docker image..."
docker build -t my-website .

echo "🏷️ Tagging image for ECR..."
docker tag my-website:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY}:latest

echo "📤 Pushing image to Amazon ECR..."
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY}:latest

echo "✅ Deployment complete!"
echo "📋 Image URI: ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY}:latest"