# aioquic-spike

Copied and hacked version of https://aioquic.readthedocs.io/en/latest/index.html examples.

https://github.com/aiortc/aioquic

### Running the server locally

- Run the server locally or remote host
```bash
docker compose run --rm -p 4433:4433 -p 4433:4433/udp client bash -c "python examples/http3_server.py --certificate tests/ssl_cert.pem --private-key tests/ssl_key.pem"
```

Notes:
- The certs are example ones and will be ignored in this example
- The upload file uses a non standard format. It was hacked together quickly. We would normally send as a multipart form
- Yes! We use the `client` service to run the server ... it's a spike!

### Install curl with http3

You will need to install http3 version of curl. 

On macOS you can use docker for this

```
alias curl3='docker run -it --rm -v "${PWD}:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v /var/run/docker.sock:/var/run/docker.sock markhigham/curl3:latest'
```

*NB because curl runs in a container you can't resolve anythin on `localhost`*

### Send a file

```
curl3 --http3-only --insecure https://10.0.0.49:4433/upload --header "X-Filename: hack2.png" -X POST --data-binary @hacker.png
```

*Note: the curl command will only have access to the current directory so you can resolve a file from (eg) ~/Downloads/test/test.png*