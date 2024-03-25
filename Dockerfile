# Use the Rocker tidyverse image as the base image
FROM rocker/tidyverse

# Install Bash
RUN apt-get update && \
    apt-get install -y bash && \
    rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c( \ 
    'cellranger' \
  , 'data.table' \
  , 'dismo' \
  , 'flextable' \
  , 'janitor' \
  , 'lme4' \
  , 'lmerTest' \
  , 'purrr' \
  , 'readxl' \
    ))"

CMD ["/bin/bash"]

## docker build -t r-github-actions .
## docker tag david-awam-jansen.github.io djanen1979/david-awam-jansen.github.io:latest
##docker login
## docker push djanen1979/david-awam-jansen.github.io:latest

#docker tag david-awam-jansen.github.io ghcr.io/david-awam-jansen/david-awam-jansen.github.io:latest
##echo "secret code here" | docker login ghcr.io -u david-awam-jansen --password-stdin
#docker push ghcr.io/david-awam-jansen/david-awam-jansen.github.io:latest


## docker push ghcr.io/david-awam-jansen/r-github-actions:latest
## docker push djanen/r-github-actions:latest