# Installing certificates 

## Prerequisites

- mkcert https://github.com/FiloSottile/mkcert
- Docker

## Setup

After installing the pre-reqs you should create the certificates in this directory

```shell
    mkcert "internal.databridge.dev"
    mkcert -install
```

This will generate the required certificate files used in the `tracker.conf` nginx config.

## Simple development use

Add entries to your hosts file

```text
echo "127.0.0.1   internal.databridge.dev" | sudo tee -a /etc/hosts && cat /etc/hosts
```


