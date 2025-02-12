# Gzip Docker image

Docker image for running `gzip` command.

## Usage

```bash
docker run \
  --volume '.:/workspace' \
  --workdir '/workspace' \
  --rm \
  gzip:latest \
  <gzip args>
```

## Building

```bash
docker build \
  --build-arg 'ALPINE_VERSION=3.21.2' \
  --build-arg 'GZIP_VERSION=1.13' \
  --build-arg 'GZIP_DOWNLOADS_URL=https://ftp.gnu.org/gnu/gzip' \
  --tag 'gzip:latest' \
  '.'
```
