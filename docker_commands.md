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
    sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm



# Saving an image in a tar.gz archive:
    docker save NameOfDockerImage > /mnt/NAS7/.../NameOfDockerImage.tar.gz


# Loading a docker image
    docker load -i /mnt/NAS7/.../NameOfDockerImage.tar.gz
    
# Remove all dangling docker images
    docker images -q --filter dangling=true | xargs docker rmi
    
# For building a docker image
    docker build -t cheemaa/tradeseq .
    
