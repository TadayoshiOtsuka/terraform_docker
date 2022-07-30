SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

check:
	tfsec

fmt:
	terraform fmt -check -recursive

init: fmt
	terraform init

plan-prod: fmt
	terraform plan -var-file prod.tfvars

plan-prod-verbose: fmt
	TF_LOG=debug terraform plan -var-file prod.tfvars

apply-prod: fmt
	terraform apply -var-file prod.tfvars
