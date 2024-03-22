FROM r-base:latest

# Install required R packages
RUN R -e "install.packages(c( \
  'tidyverse', \
  'cellranger', \
  'data.table', \
  'janitor', \
  'purrr', \
  'readxl', \
  'flextable' \
))"

## docker build r-github-actions  .
## docker push ghcr.io/david-awam-jansen/r-github-actions:latest
