# Command for compiling singularity images
    singularity shell tradeseq_img.img
    
# Running analysis with singularity in the backend
    nohup singularity exec singularity_image Rscript -e "rmarkdown::render('Rmarkdown.Rmd')" > mylogfile &
    
# Converting docker image to singularity
    ./DockerToSingularity.sh   name_of_docker_image singularity_image_to_make size_of_singularity_image  # name of docker image can be obtained from command `docker images`. DockerToSingularity.sh can be found in the files
