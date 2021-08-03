#! /bin/bash

set -e
set -x

IMAGE_REPOSITORY=${1:-eugenmayer/docker-dind-sshd}
IMAGE_TAG=${2:-1.0.0}
DIND_VERSION=${3:-20.10.7-dind}

SCRIPT_DIRECOTRY=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
IMAGE=${IMAGE_REPOSITORY}:${IMAGE_TAG}

docker build --rm ${SCRIPT_DIRECOTRY} -f ${SCRIPT_DIRECOTRY}/Dockerfile -t ${IMAGE} --build-arg DIND_VERSION=${DIND_VERSION}
docker push ${IMAGE}
