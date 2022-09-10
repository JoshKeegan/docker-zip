# docker-zip
A docker image with the zip and unzip commands

[![CI/CD](https://github.com/joshkeegan/docker-zip/actions/workflows/cicd.yaml/badge.svg?branch=master)](https://github.com/JoshKeegan/docker-zip/actions?query=branch%3Amaster)  

## Usage
Use like any other docker image. It's URL is `joshkeegan/zip:latest`. See [Docker Hub](https://hub.docker.com/r/joshkeegan/zip/tags/) for specific version tags.

## Supported Architectures
The image is supported for the following architectures:
 - AMD64
 - ARMv7
 - ARM64

## Contributing
 - Install dependencies: `make`, `docker`, `docker buildx` (included with docker desktop)
 - Create a buildx builder instance for cross-platform builds with `docker buildx create --use`
 - Run `make build`

## License
[MIT](LICENSE)