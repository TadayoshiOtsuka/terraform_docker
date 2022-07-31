SHELL=ash

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

plan-stg: check
	terraform plan -var-file stg.tfvars

plan-stg-verbose: check
	TF_LOG=debug terraform plan -var-file stg.tfvars

apply-stg: check
	terraform apply -var-file stg.tfvars
