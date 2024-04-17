#!/bin/bash
# shared by bionfo platform @ ciml (https://github.com/CIML-bioinformatic)
# The name of the Docker image to run
DOCKER_IMAGE=$1
# The name of the Singularity image to create
SINGULARITY_IMAGE=$2
# The size in MiB
SIZE=$3

# Create the Singularity file
echo --------------------------
echo Creating Singularity file
echo --------------------------

sudo singularity image.create --size $SIZE $SINGULARITY_IMAGE.img

# Start the Docker container
echo -----------------------
echo Starting Docker image
echo -----------------------

sudo docker run --name $SINGULARITY_IMAGE -d $DOCKER_IMAGE sleep 1800

# Convert the container to Singularity
echo ---------------------------------------
echo Converting Docker image to Singularity
echo ---------------------------------------

sudo docker export $SINGULARITY_IMAGE | sudo singularity image.import $SINGULARITY_IMAGE.img

echo ---------------------------------------------------
echo Changing owner of Singularity image to current user
echo ---------------------------------------------------
sudo chown $(whoami):$(id -g) $SINGULARITY_IMAGE.img

# Stop and remove the container
echo --------------------------
echo Removing Docker container
echo --------------------------
sudo docker stop $SINGULARITY_IMAGE
sudo docker rm $SINGULARITY_IMAGE
