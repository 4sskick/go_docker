FROM golang:1.23.0-alpine3.20

WORKDIR /go_project/src/app

# Use the project name to set the module path
ENV GO111MODULE=auto

COPY . .