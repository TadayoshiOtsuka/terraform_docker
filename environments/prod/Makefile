SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

fmt:
	terraform fmt -check -recursive

plan-prod: fmt
	terraform plan -var-file prod.tfvars

plan-prod-verbose: fmt
	TF_LOG=debug terraform plan -var-file prod.tfvars

apply-prod: fmt
	terraform apply -var-file prod.tfvars
