# Project 4: Containerization with Docker

## Build (Phase 2)
    docker build -t my-app:v1 .

## Run (Phase 3)
    docker run -d -p 8080:3000 --name my-app my-app:v1

Host port 8080 -> container port 3000. Then open http://localhost:8080

## Useful commands
    docker ps                      # is it running?
    docker logs my-app             # view logs of the detached container
    docker exec -it my-app sh      # shell inside the container
    docker stop my-app && docker rm my-app
    docker images my-app           # check image size

## Try the CMD override (ENTRYPOINT stays "node")
    docker run --rm my-app:v1 -e "console.log('swapped CMD!')"
