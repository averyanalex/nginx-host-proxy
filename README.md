# Nginx Host Proxy
Proxy all TCP traffic to specified host.

Useful for restricting container's outgoing connections

# Usage

```yaml
version: '3.7'

services:
  google-proxy:
    image: ghcr.io/averyanalex/nginx-host-proxy
    networks:
      - internet
      - no-internet
    environment:
      HOST: google.com
      PORTS: 80 443

  curl:
    image: curlimages/curl
    networks:
      - no-internet
    command: https://google.com
    links:
      - google-proxy:google.com
    depends_on:
      - google-proxy

networks:
  internet: {}
  no-internet:
    internal: true

```
