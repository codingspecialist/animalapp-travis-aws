#!/bin/bash

echo "1. 환경 설정하기"
REPOSITORY=/home/ubuntu/webapp
DEPLOY_DIRECTORY=/home/ubuntu/deploy
PROJECT_NAME=animalapp
JAR_NAME=$REPOSITORY/$PROJECT_NAME/animalapp.jar

echo "2. jar 파일 webapp/animalapp 폴더로 복사하기"

mkdir $REPOSITORY/$PROJECT_NAME
cp $DEPLOY_DIRECTORY/build/libs/*.jar $REPOSITORY/$PROJECT_NAME/animalapp.jar

echo "3. 현재 구동중인 애플리케이션 pid 확인해서 강제종료하기"

CURRENT_PID=$(pgrep -fl $PROJECT_NAME | grep jar | awk '{print $1}')

if [ -z "$CURRENT_PID" ]; then
   echo "> 현재 구동 중인 애플리케이션이 없으므로 종료하지 않습니다."
else
   echo "> kill -15 $CURRENT_PID"
   kill -15 $CURRENT_PID
   sleep 5
fi

echo "4. jar파일 실행권한 주고 nohup 으로 실행하기"

chmod +x $JAR_NAME
# nohup java -jar -Dspring.profiles.active=alpha -Dfile.encoding=UTF-8  $JAR_NAME > $REPOSITORY/$PROJECT_NAME/nohup.out 2>&1 &
nohup java -jar $JAR_NAME &