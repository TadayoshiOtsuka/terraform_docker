SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

sec:
	tfsec

sec-min:
	tfsec --minimum-severity HIGH

lint:
	tflint

fmt:
	terraform fmt -check -recursive

check: fmt lint sec-min

init: fmt
	terraform init

plan-prod: check
	terraform plan -var-file prod.tfvars

plan-prod-verbose: check
	TF_LOG=debug terraform plan -var-file prod.tfvars

apply-prod: check
	terraform apply -var-file prod.tfvars
