FROM golang:1.23.0-alpine3.20
# ARGS PROJECT_NAME

# install necessary
RUN go get -v golang.org/x/tools/gopls  && \

    # auto import & organize
    go get -v golang.org/x/tools/cmd/goimports  && \

    # go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs  && \
    # go get -v github.com/ramya-rao-a/go-outline && \

    # ability to debug
    go get -v github.com/go-delve/delve/cmd/dlv

WORKDIR /go_project/src/app

# Use the project name to set the module path
ENV GO111MODULE=auto

COPY . .