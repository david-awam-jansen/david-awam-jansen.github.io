# Use the Rocker tidyverse image as the base image
FROM rocker/r-ver:4.3.3
RUN /rocker_scripts/install_tidyverse.sh

# Install Bash
RUN apt-get update && \
    apt-get install -y bash curl && \
    rm -rf /var/lib/apt/lists/*

# Download and install quarto using dpkg
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb && \
    dpkg -i quarto-linux-amd64.deb && \
    rm quarto-linux-amd64.deb

# Install R packages required for quarto

RUN  R -e "install.packages(c( \ 
        'knitr' \
      , 'rmarkdown' \
      , 'downlit' \
#      , 'xml2' \
      , lib = '/usr/local/lib/R/library' \
        ))"

# Install R packages needed for workshops
RUN R -e "install.packages(c( \
  'broom', \
  'cellranger', \
  'cowplot', \
  'data.table', \
  'dismo', \
  'flextable', \
  'ggtext', \
  'janitor', \
  'lme4', \
  'lmerTest', \
  'purrr', \
  'readxl', \
  'showtext' \
  ))"

## First build a Docker
## docker build -t djanen1979/david-awam-jansen.github.io .

## for docker
## docker tag david-awam-jansen.github.io djanen1979/david-awam-jansen.github.io:latest
##docker login
## docker push djanen1979/david-awam-jansen.github.io:latest

## for ghcr.io
#docker tag david-awam-jansen.github.io ghcr.io/david-awam-jansen/david-awam-jansen.github.io:latest
##echo "secret code here" | docker login ghcr.io -u david-awam-jansen --password-stdin
#docker push ghcr.io/david-awam-jansen/david-awam-jansen.github.io:latest


## docker push ghcr.io/david-awam-jansen/r-github-actions:latest
## docker push djanen/r-github-actions:latest