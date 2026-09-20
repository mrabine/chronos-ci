# chronos-ci
[![Status](https://github.com/mrabine/chronos-ci/actions/workflows/cd.yml/badge.svg?branch=main)](https://github.com/mrabine/chronos-ci/actions?query=workflow%3Acd+branch%3Amain)
[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mrabine/chronos-ci/blob/main/LICENSE)

Docker image for chronos continuous integration.

This is an Ubuntu based docker image, with all the mandatory tools for the chronos project continuous integration (building and testing).

## Build user

BitBake refuses to run as root, so the image runs as the unprivileged `chronos` user, which is granted passwordless sudo.
Its uid and gid default to `1001` to match the user running jobs on GitHub hosted runners, and can be overridden at build time:

```bash
docker build --build-arg CHRONOS_UID=1000 --build-arg CHRONOS_GID=1000 -t joinframework/chronos-ci .
```

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

To deploy the docker image to docker hub by hand do this:
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
