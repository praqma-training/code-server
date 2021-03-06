#!/bin/bash
docker build -t praqma/vscode:tmp .
docker run --rm \
    -v $PWD/goss.yaml:/goss.yaml  \
    -v $PWD/goss_wait.yaml:/goss_wait.yaml \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e GOSS_FILES_STRATEGY=cp \
    praqma/dgoss:0.3.7 dgoss run  \
        -e SECURE=true \
        praqma/vscode:tmp