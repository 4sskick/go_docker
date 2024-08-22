build image
if wanna passing the argument
`docker-compose -f <docker compose file yml> build --build-arg "PROJECT_NAME=go-docker" --no-cache`
and on docker-compose file uncomment the args under build section
and on Dockerfile file uncomment the ARGS

otherwise just run as usual
`docker-compose -f <docker compose file yml> build`

because container is always running, use able to go inside the container by command
`docker exec -it go_gen sh`

<!-- or (recomended)
`docker-compose run --rm generator sh -c "go version && go mod init example.com/go-test"`
above 2 commands will create container then execute bash command, after that removed -->

run command
`go mod init <ex: example.com/go-test or whatever project you want>`

the command will generate the `go.mod` file and reflected into local folder

doing build on executable file
because container is built under linux, when run `go build` will produce compiled file which only run by `arc` os by default
if wanna produce compiled file which able to run by `windows` os

<!-- `docker-compose run --rm generator sh -c "GOOD=windows GOARCH=amd64 go build"` -->

`GOOD=windows GOARCH=amd64 go build`
