# Command for compiling singularity images
    singularity shell tradeseq_img.img
    
# Running analysis with singularity in the backend
    nohup singularity exec singularity_image Rscript -e "rmarkdown::render('Rmarkdown.Rmd')" > mylogfile &
