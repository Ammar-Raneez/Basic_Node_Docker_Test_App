docker ps --> display all running containers
docker ps -a --> display all containers

docker run -p 3000:4200 {container_name} --> create new container and run on local port 3000, where the container is exposed to 4200

docker start {container_id/name} --> start created container in detached mode (doesn't block the cli unlike docker run/ don't listen to container logs)

docker stop {container_id/name} --> stop container

docker run -p 3000:4200 -d {container_name} --> same, but in detached mode

docker attach {container_name} --> attach to a running container

docker logs {container_name} --> view past logs of this container

docker logs -f {container_name} --> view past & attach to future logs

docker start -a {container_id/name} --> start created container in attached mode