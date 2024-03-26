on:
  workflow_dispatch:
  push:
    branches: main

name: Quarto Publish

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - name: Check out repository
        uses: actions/checkout@v4

      - name: Set up Quarto
        uses: quarto-dev/quarto-actions/setup@v2

      - name: Set up Docker
        uses: actions/setup-python@v2
        with:
          python-version: '3.x'

      - name: Build Docker image
        run: |
          docker build -t my_r_image ../../
        working-directory: .github/workflows

      - name: Run Docker container
        run: docker run --rm my_r_image
        working-directory: .github/workflows

      - name: Render and Publish
        uses: quarto-dev/quarto-actions/publish@v2
        with:
          target: gh-pages
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

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