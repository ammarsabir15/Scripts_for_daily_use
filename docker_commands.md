# To run a docker container from a docker image
    docker run --name container_name -d -p 8181:8787 -v /home/$USER/jac_analysis:/home/$USER/jac_analysis -v /mnt:/mnt -e USER=$(whoami) -e USERID=$(id -u) -e GROUPID=$(id -g) -e PASSWORD=your_password -t docker_image

# To list the build docker images
    docker images
    
# To remove a docker image    
    docker rmi <image-name>
    
# To list the running docker containers
    docker ps
    
# To list all the docker containers
    docker ps -a

# To remove a stopped docker container
    docker rm <container-name>

# To remove all stopped containers
    docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm

# Saving an image in a tar.gz archive:
    docker save NameOfDockerImage > /mnt/NAS7/.../NameOfDockerImage.tar.gz

# Loading a docker image
    docker load -i /mnt/NAS7/.../NameOfDockerImage.tar.gz
    
# Remove all dangling docker images
    docker images -q --filter dangling=true | xargs docker rmi
    
# For building a docker image
    docker build -t cheemaa/tradeseq .
    
# To restart a docker container (previously shut down)
    docker restart container_id

# To view the container log
    docker logs <container_id>

# To stop a container
    docker stop <container_id>

# To kill a container
    docker kill <container_id>
    
# To run docker image in interactive mode
    docker run -it <image_name> /bin/bash

# find directory mount to docker image or inspect other aspects for the docker image
    docker inspect <container_name>

# To run docker an existing container in interactive mode
    docker exec -it <container> /bin/bash

# Lists all containers, including stopped ones
    docker ps -a  

# To start a stopped container
    docker start <container>
