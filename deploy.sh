#!/bin/bash

echo "1. 환경 설정하기"
REPOSITORY=/home/ubuntu/webapp
DEPLOY_DIRECTORY=/home/ubuntu/deploy
PROJECT_NAME=animalapp

echo "2. jar 파일 webapp/animalapp 폴더로 복사하기"

mkdir $REPOSITORY/$PROJECT_NAME
cp $DEPLOY_DIRECTORY/build/libs/*.jar $REPOSITORY/$PROJECT_NAME/animalapp.jar

# 현재 구동중인 애플리케이션 pid 확인해서 강제종료 시키고 새 애플리케이션 실행 필요!! - Profile 모드 적용!!