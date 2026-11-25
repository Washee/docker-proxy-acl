[![Docker](https://github.com/Washee/docker-proxy-acl/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Washee/docker-proxy-acl/actions/workflows/docker-publish.yml)
[![Docker Image Security Scan](https://github.com/Washee/docker-proxy-acl/actions/workflows/trivy.yml/badge.svg)](https://github.com/Washee/docker-proxy-acl/actions/workflows/trivy.yml)
![Docker Image Size](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/washee/docker-proxy-acl/master/badges/image-size.json)
# docker-proxy-acl

To create:
```
docker create \
  --name=docker-proxy \
  -e "OPTIONS=***" \
  -v /tmp/docker-proxy-acl:/tmp/docker-proxy-acl \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ghcr.io/kmlucy/docker-proxy-acl
```

If you do not set options, they default to `-a containers`.

Based on [titpetric/docker-proxy-acl](https://github.com/titpetric/docker-proxy-acl)

Based on [kmlucy/docker-proxy-acl](https://github.com/kmlucy/docker-proxy-acl)

## Features

- This image is based on scratch to significantly reduce image size
- Reducing vulnerabilities
