# chronos-ci
[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mrabine/chronos-ci/blob/main/LICENSE)

Docker image for chronos continuous integration.

This is an Ubuntu based docker image, with all the mandatory tools for the chronos project continuous integration (building and testing).

## Creating image

To create the docker image do this:
```bash
docker build -t joinframework/chronos-ci .
```

## Testing image

To run and test the docker image do this:
```bash
docker run -it --privileged --rm joinframework/chronos-ci
```

## Pushing image to docker hub

To deploy the docker image to docker hub do this:
```bash
docker push joinframework/chronos-ci:latest
```

## Creating a local image

To create a local image tarball do this:
```bash
docker save -o chronos-ci.tar joinframework/chronos-ci:latest
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
