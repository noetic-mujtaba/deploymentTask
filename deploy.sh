#!/bin/bash

##### This Script is to dockerize apps #####
APPNAME='deploymentask'
DIR='/home/mujtaba/deploymentTask/'
DIRLOG="/var/log/apps/deploymentTask/"
IMAGE='deploymentask'
CONTAINER='deploymentask_c'

echo "Pull request from GitHub repo to ~${APPNAME} directory ..." && echo "" && \
[ ! -d "${DIR}" ] && mkdir -p "${DIR}"
[ ! -d "${DIRLOG}" ] && mkdir -p "${DIRLOG}"
cd ${DIR}
echo "moving to  git pull"
git stash && git pull origin main 

echo "moving to docker"

if [ $( docker ps -a | grep ${CONTAINER} | wc -l ) -gt 0 ]; then
echo "container ~${IMAGE}_c already exists"
echo "Stopping ${IMAGE}_c from production environment ..." && echo "" && \
docker stop ${IMAGE}_c  &&
echo "destroying ${IMAGE}_c container  ..." && echo "" && \
docker rm -f ${IMAGE}_c &&
echo "deleting Docker Image  ..." && echo "" &&
docker rmi -f ${IMAGE}
else
echo "container ~${IMAGE} does not exist"
fi
/opt/apache-maven-3.9.2/bin/mvn clean install &&
echo "Creating Build for newly pulled code ..." && echo "" && \
docker buildx build -t ${IMAGE} . &&
echo "Deploying the container ${IMAGE}_c ..." && echo "" && \
[ ! -d "${DIRLOG}" ] && mkdir -p "${DIRLOG}"
docker run -d --restart unless-stopped -p 9090:9090 -v ${DIRLOG}:${DIRLOG} --name ${IMAGE}_c ${IMAGE}  &&
echo "Build Successfull ..." && echo "" &&

echo "Success"
exit
 
