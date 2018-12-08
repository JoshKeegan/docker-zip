# dotnet-build
A docker image that adds the following additional programs:
 - make

## Usage
Use like any other docker image. It's URL is `joshkeegan/dotnet-build:latest`. See [Docker Hub](https://hub.docker.com/r/joshkeegan/dotnet-build/tags/) for specific version tags.

## Publishing
Note: only people authorised to publish to this repo on Docker Hub can publish the image.

 - Log in to Docker Hub (with `docker login`). 
 - Let `make` handle everything else:
```bash
make publish
```

## License
[MIT](LICENSE)