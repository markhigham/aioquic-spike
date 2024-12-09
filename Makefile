SHELL := /bin/bash
APPLICATION_NAME="aioquic-spike"
APPLICATION_VERSION=1.0

# Colour coding for output
COLOUR_NONE=\033[0m
COLOUR_GREEN=\033[1;36m
COLOUR_YELLOW=\033[33;01m

.PHONY: help test
help:
	@echo -e "$(COLOUR_GREEN)|--- $(APPLICATION_NAME) [$(APPLICATION_VERSION)] ---|$(COLOUR_NONE)"
	@echo -e "$(COLOUR_YELLOW)make build$(COLOUR_NONE) : build the container for local dev"
	@echo -e "$(COLOUR_YELLOW)make server$(COLOUR_NONE) : run the server"
	@echo -e "$(COLOUR_YELLOW)make client$(COLOUR_NONE) : runs the default client"


.PHONY: build
build:
	docker build . -t aioquic-spike

.PHONY: server
server:
	docker compose up -d server

.PHONY: client
client:
	docker compose run --rm client bash -c "python examples/http3_client.py https://server:4433/"
