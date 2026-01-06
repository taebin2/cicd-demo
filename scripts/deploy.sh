#!/bin/bash

echo "🚀 배포 시작..."

# 새 이미지 가져오기
echo "📦 Docker 이미지 Pull..."
docker pull $DOCKER_IMAGE:latest

# 기존 컨테이너 정리
echo "🧹 기존 컨테이너 정리..."
docker stop cicd-demo || true
docker rm cicd-demo || true

# 새 컨테이너 실행
echo "🐳 새 컨테이너 실행..."
docker run -d \
  --name cicd-demo \
  -p 8080:8080 \
  -e DB_URL \
  -e DB_USERNAME \
  -e DB_PASSWORD \
  $DOCKER_IMAGE:latest

echo "✅ 배포 완료!"
