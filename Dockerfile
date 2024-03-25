# Use the Rocker tidyverse image as the base image
FROM rocker/tidyverse

# Install Bash
RUN apt-get update && \
    apt-get install -y bash && \
    rm -rf /var/lib/apt/lists/*

# Create a file to store output
RUN touch /output.txt

# Install R packages and redirect output to the file
RUN echo "Installing R packages..." >> /output.txt && \
    R -e "install.packages(c( \ 
        'cellranger' \
      , 'data.table' \
      , 'dismo' \
      , 'flextable' \
      , 'janitor' \
      , 'lme4' \
      , 'lmerTest' \
      , 'purrr' \
      , 'readxl' \
        ))" >> /output.txt && \
    echo "R packages installation completed." >> /output.txt
