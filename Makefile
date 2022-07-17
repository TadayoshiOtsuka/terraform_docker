SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

set-up:
	docker-compose build

tf-prod:
	docker-compose run --rm terraform-prod

tf-stg:
	docker-compose run --rm terraform-stg