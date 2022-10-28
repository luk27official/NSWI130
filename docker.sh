#!/bin/bash

docker run -it --rm -p 8080:8080 -v $PWD/structurizr:/usr/local/structurizr structurizr/lite